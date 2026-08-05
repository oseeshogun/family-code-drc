#!/usr/bin/env python3
"""
Parseur du Code de la famille de la RDC (Loi 87-010, consolidée par la Loi 16/008).

Entrée  : texte extrait du PDF via pdftotext
Sortie  : un fichier YAML par livre + fichiers de référence + rapport d'anomalies

Le parseur ne « répare » jamais silencieusement le texte source : toute
irrégularité (numérotation, bloc déplacé, article tronqué) est consignée
dans anomalies.yaml avec sa localisation.
"""

import re
import json
import unicodedata
from pathlib import Path
from collections import Counter, OrderedDict

BASE = Path(__file__).parent
SRC = BASE / "brut.txt"
OUT = BASE / "out"

ROMAINS = {
    "I": 1, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6, "VII": 7,
    "VIII": 8, "IX": 9, "X": 10, "XI": 11, "XII": 12, "XIII": 13,
}

# --------------------------------------------------------------------------
# 1. Chargement et nettoyage
# --------------------------------------------------------------------------

def charger_corps():
    txt = SRC.read_text(encoding="utf-8")
    ancre = "CODE DE LA FAMILLE\nLIVRE I DE LA NATIONALITE"
    i = txt.find(ancre)
    if i < 0:
        raise SystemExit("Ancre de debut du corps introuvable")
    corps = txt[i + len("CODE DE LA FAMILLE\n"):]
    fin = corps.find("La presente compilation")
    if fin < 0:
        fin = corps.find("La présente compilation")
    if fin > 0:
        corps = corps[:fin]
    return corps


def nettoyer(corps):
    """Retire les sauts de page, les numéros de page isolés et les lignes vides multiples."""
    corps = corps.replace("\x0c", "\n")
    lignes = []
    for l in corps.split("\n"):
        s = l.strip()
        if re.fullmatch(r"\d{1,3}", s):      # numéro de page isolé
            continue
        lignes.append(l.rstrip())
    return lignes


# --------------------------------------------------------------------------
# 2. Classification des lignes
# --------------------------------------------------------------------------

RE_LIVRE = re.compile(r"^\s*LIVRE\s+([IVX]+|\d+)(?:er)?\s*[-–—:.]?\s*(.*)$")
RE_TITRE = re.compile(r"^\s*TITRES?\s+([IVX]+|\d+)(?:er|s)?\s*[-–—:.]?\s*(.*)$")
RE_CHAP = re.compile(r"^\s*CHAPITRE\s+([IVX]+|\d+)(?:er|ER)?\s*[-–—:.]?\s*(.*)$", re.I)
RE_SECT = re.compile(r"^\s*Section\s+([IVX]+|\d+)(?:er|ere|ère)?\s*[-–—:.]?\s*(.*)$", re.I)
RE_PARA = re.compile(r"^\s*(?:Paragraphe|§)\s*(\d+)(?:er)?\s*[-–—:.]?\s*(.*)$", re.I)
RE_SSECT = re.compile(r"^\s*Sous[- ]section\s+([IVX]+|\d+)(?:er|ere|ère)?\s*[-–—:.]?\s*(.*)$", re.I)
# Sous-titres non numérotés, en chiffres romains ou en lettres : « II. Du tuteur
# délégué », « C) Du régime de la communauté universelle ». Garde-fous : commence
# par De/Du/Des/D', tient sur une ligne courte, pas de ponctuation de fin de phrase.
RE_LETTRE = re.compile(r"^\s*([A-H])[.)]\s+(D[eu'’].{3,78})$")
RE_ROMAIN = re.compile(r"^\s*([IVX]{1,5})[.)]\s+(D[eu'’].{3,78})$")
RE_CHIFFRE = re.compile(r"^\s*(\d{1,2})[.)]\s+(D[eu'’].{3,78})$")
RE_ART = re.compile(
    r"^\s*(Articles?)\s+(\d+)\s*(bis|ter|quater)?\s*(?:(:)\s*(.*)|$)", re.I
)
RE_ABROGE = re.compile(r"abrog[ée]e?\s+par\s+la\s+loi\s+n°?\s*16/008", re.I)
RE_RENVOI = re.compile(r"\barticles?\s+(\d+)\s*(bis|ter)?", re.I)

NIVEAUX = OrderedDict([
    ("livre", 1), ("titre", 2), ("chapitre", 3),
    ("section", 4), ("sous_section", 5), ("paragraphe", 6),
    ("subdivision", 7),
])


def num_ordre(num):
    num = num.strip().upper()
    if num in ROMAINS:
        return ROMAINS[num]
    if num.isdigit():
        return int(num)
    return 0


def classer(ligne):
    """Retourne (type, numero, intitule) ou None."""
    s = ligne.strip()
    if not s:
        return None
    m = RE_ART.match(s)
    if m:
        # un en-tête d'article porte soit « : », soit rien après le numéro
        suffixe = (m.group(3) or "").lower()
        pluriel = m.group(1).lower() == "articles"
        return ("article", m.group(2) + (" " + suffixe if suffixe else ""),
                (m.group(5) or "").strip(), pluriel)
    for typ, rx in (("livre", RE_LIVRE), ("titre", RE_TITRE),
                    ("chapitre", RE_CHAP), ("sous_section", RE_SSECT),
                    ("section", RE_SECT), ("paragraphe", RE_PARA)):
        m = rx.match(s)
        if m:
            return (typ, m.group(1).strip(), nettoyer_intitule(m.group(2)))
    if len(s) <= 90 and not s.endswith((";", ",")):
        for rx in (RE_LETTRE, RE_ROMAIN, RE_CHIFFRE):
            m = rx.match(s)
            if m:
                return ("subdivision", m.group(1), nettoyer_intitule(m.group(2)))
    return None


def nettoyer_intitule(t):
    t = re.sub(r"\s+", " ", (t or "").strip())
    t = t.rstrip(" .:")
    return t


# --------------------------------------------------------------------------
# 3. Construction de l'arbre
# --------------------------------------------------------------------------

class Noeud:
    def __init__(self, typ, numero, intitule, ordre):
        self.type = typ
        self.numero = numero
        self.intitule = intitule
        self.ordre = ordre
        self.enfants = []
        self.articles = []
        self.chemin = ""


def numero_tri(numero):
    """« 361 bis » -> 361.1 ; permet l'insertion sans renuméroter."""
    m = re.match(r"(\d+)\s*(bis|ter|quater)?", numero)
    base = int(m.group(1))
    suff = {"bis": 1, "ter": 2, "quater": 3}.get(m.group(2) or "", 0)
    return round(base + suff / 10, 1)


def decouper_alineas(bloc):
    """Sépare le contenu en alinéas et en points numérotés."""
    alineas = []
    courant = []
    for ligne in bloc:
        s = ligne.strip()
        if not s:
            if courant:
                alineas.append(" ".join(courant))
                courant = []
            continue
        if re.match(r"^\d{1,2}\s*[.)°]", s) or re.match(r"^[•\-–]\s", s):
            if courant:
                alineas.append(" ".join(courant))
                courant = []
        courant.append(s)
    if courant:
        alineas.append(" ".join(courant))
    # un marqueur isolé (« 1. » sur sa propre ligne) appartient au point suivant
    fusion = []
    for a in alineas:
        a = re.sub(r"\s+", " ", a).strip()
        if fusion and re.fullmatch(r"\d{1,2}\s*[.)°]", fusion[-1]):
            fusion[-1] = fusion[-1] + " " + a
        else:
            fusion.append(a)
    alineas = fusion

    res = []
    for i, a in enumerate(alineas, 1):
        a = re.sub(r"\s+", " ", a).strip()
        if not a:
            continue
        if re.match(r"^\d{1,2}\s*[.)°]", a):
            typ = "point"
        elif re.match(r"^[•\-–]\s", a):
            typ = "tiret"
        else:
            typ = "alinea"
        res.append({"ordre": len(res) + 1, "type": typ, "contenu": a})
    return res


def parser(lignes):
    racine = Noeud("code", "", "Code de la famille", 0)
    pile = [racine]
    compteurs = Counter()
    article_courant = None
    bloc = []
    articles_plats = []
    anomalies = []

    def fermer_article():
        nonlocal article_courant, bloc
        if article_courant is None:
            return
        alineas = decouper_alineas(bloc)
        contenu = "\n".join(a["contenu"] for a in alineas)
        article_courant["alineas"] = alineas
        article_courant["contenu"] = contenu
        if RE_ABROGE.search(contenu) or RE_ABROGE.search(article_courant["_amorce"]):
            article_courant["statut"] = "abroge"
            article_courant["texte_source"] = "loi-16-008"
            article_courant["date_debut_vigueur"] = "2016-07-15"
            article_courant["contenu"] = None
            article_courant["alineas"] = []
        article_courant.pop("_amorce", None)
        article_courant = None
        bloc = []

    for idx, ligne in enumerate(lignes):
        c = classer(ligne)
        if c is None:
            if article_courant is not None:
                bloc.append(ligne)
            continue

        typ, numero, intitule = c[0], c[1], c[2]
        pluriel = c[3] if len(c) > 3 else False

        if typ == "article":
            fermer_article()
            art = {
                "numero": numero,
                "numero_tri": numero_tri(numero),
                "ordre": len(articles_plats) + 1,
                "statut": "en_vigueur",
                "texte_source": None,
                "date_debut_vigueur": None,
                "date_fin_vigueur": None,
                "_amorce": intitule,
                "_ligne_source": idx,
                "entete_au_pluriel": pluriel,
            }
            if intitule:
                bloc = [intitule]
            else:
                bloc = []
            article_courant = art
            articles_plats.append(art)
            pile[-1].articles.append(art)
            continue

        # division
        fermer_article()
        niv = NIVEAUX[typ]
        while len(pile) > 1 and NIVEAUX.get(pile[-1].type, 0) >= niv:
            pile.pop()
        compteurs[(id(pile[-1]), typ)] += 1
        n = Noeud(typ, numero, intitule, compteurs[(id(pile[-1]), typ)])
        pile[-1].enfants.append(n)
        pile.append(n)

    fermer_article()

    # chemins matérialisés
    def chemin(n, prefixe=""):
        for i, e in enumerate(n.enfants, 1):
            e.chemin = f"{prefixe}{i}" if not prefixe else f"{prefixe}.{i}"
            chemin(e, e.chemin)
    chemin(racine)

    return racine, articles_plats, anomalies


# --------------------------------------------------------------------------
# 4. Contrôles d'intégrité
# --------------------------------------------------------------------------

def controler(articles):
    anomalies = []
    vus = {}
    precedent = 0
    for a in articles:
        base = int(re.match(r"\d+", a["numero"]).group())
        cle = a["numero"]
        if cle in vus:
            anomalies.append({
                "type": "numero_duplique",
                "numero": cle,
                "occurrences": [vus[cle], a["ordre"]],
                "consequence": "deux articles portent le même numéro dans la compilation",
            })
        vus[cle] = a["ordre"]
        if base < precedent:
            a["rattachement_suspect"] = True
            anomalies.append({
                "type": "rupture_de_sequence",
                "numero": cle,
                "numero_precedent": precedent,
                "ordre_apparition": a["ordre"],
                "consequence": "bloc inséré hors de sa position logique dans le PDF",
            })
        precedent = max(precedent, base)

    bases = {int(re.match(r"\d+", a["numero"]).group()) for a in articles}
    manquants = [n for n in range(1, max(bases) + 1) if n not in bases]
    if manquants:
        anomalies.append({
            "type": "numeros_absents",
            "numeros": manquants,
            "consequence": "aucun article portant ces numéros dans la compilation",
        })

    for a in articles:
        if a.get("entete_au_pluriel"):
            anomalies.append({
                "type": "entete_au_pluriel",
                "numero": a["numero"],
                "ordre_apparition": a["ordre"],
                "consequence": "coquille de la compilation : « Articles N : » au lieu de « Article N : »",
            })
        c = a.get("contenu") or ""
        if c and not re.search(r"[.;:!?\u00bb\)]\s*$", c):
            a["contenu_tronque"] = True
            anomalies.append({
                "type": "contenu_tronque",
                "numero": a["numero"],
                "ordre_apparition": a["ordre"],
                "fin_observee": c[-60:],
                "consequence": "le texte s'interrompt sans ponctuation finale",
            })
    for a in articles:
        if a["statut"] == "en_vigueur" and not a.get("contenu"):
            anomalies.append({
                "type": "contenu_vide",
                "numero": a["numero"],
                "ordre_apparition": a["ordre"],
            })
    return anomalies


def extraire_renvois(articles):
    index = {a["numero"].replace(" ", ""): a for a in articles}
    for a in articles:
        if not a.get("contenu"):
            a["renvois"] = []
            continue
        cibles = []
        for m in RE_RENVOI.finditer(a["contenu"]):
            cible = m.group(1) + (m.group(2).lower() if m.group(2) else "")
            if cible == a["numero"].replace(" ", ""):
                continue
            portee = "interne" if cible in index else "externe_ou_introuvable"
            if cible not in [c["article_cible"] for c in cibles]:
                cibles.append({"article_cible": cible, "portee": portee})
        a["renvois"] = cibles


# --------------------------------------------------------------------------
# 5. Sérialisation YAML (sans dépendance externe)
# --------------------------------------------------------------------------

def yq(s):
    """Quote une valeur scalaire YAML."""
    if s is None:
        return "null"
    if isinstance(s, bool):
        return "true" if s else "false"
    if isinstance(s, (int, float)):
        return str(s)
    s = str(s)
    if s == "":
        return '""'
    if re.fullmatch(r"[A-Za-z_][A-Za-z0-9_./\- ]*", s) and s.strip() == s:
        if not re.fullmatch(r"(true|false|null|yes|no|on|off|~|\d+|\d+\.\d+)", s, re.I):
            return s
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def bloc_litteral(s, indent):
    pad = " " * indent
    lignes = s.split("\n")
    return "|-\n" + "\n".join(pad + l for l in lignes)


def ser_article(a, indent):
    p = " " * indent
    out = [f"{p}- numero: {yq(a['numero'])}"]
    q = p + "  "
    out.append(f"{q}numero_tri: {a['numero_tri']}")
    out.append(f"{q}ordre: {a['ordre']}")
    for drapeau in ("rattachement_suspect", "contenu_tronque", "entete_au_pluriel"):
        if a.get(drapeau):
            out.append(f"{q}{drapeau}: true")
    out.append(f"{q}version:")
    r = q + "  "
    out.append(f"{r}num_version: 1")
    out.append(f"{r}statut: {a['statut']}")
    out.append(f"{r}texte_source: {yq(a['texte_source'])}")
    out.append(f"{r}date_debut_vigueur: {yq(a['date_debut_vigueur'])}")
    out.append(f"{r}date_fin_vigueur: {yq(a['date_fin_vigueur'])}")
    if a.get("contenu"):
        out.append(f"{r}contenu: " + bloc_litteral(a["contenu"], len(r) + 2))
    else:
        out.append(f"{r}contenu: null")
    if a.get("alineas"):
        out.append(f"{r}alineas:")
        for al in a["alineas"]:
            out.append(f"{r}  - ordre: {al['ordre']}")
            out.append(f"{r}    type: {al['type']}")
            out.append(f"{r}    contenu: " + bloc_litteral(al["contenu"], len(r) + 8))
    else:
        out.append(f"{r}alineas: []")
    if a.get("renvois"):
        out.append(f"{r}renvois:")
        for rv in a["renvois"]:
            out.append(f"{r}  - article_cible: {yq(rv['article_cible'])}")
            out.append(f"{r}    portee: {rv['portee']}")
    else:
        out.append(f"{r}renvois: []")
    return out


def ser_division(n, indent):
    p = " " * indent
    out = [f"{p}- type: {n.type}"]
    q = p + "  "
    out.append(f"{q}numero: {yq(n.numero)}")
    out.append(f"{q}intitule: {yq(n.intitule)}")
    out.append(f"{q}ordre: {n.ordre}")
    out.append(f"{q}chemin: {yq(n.chemin)}")
    if n.articles:
        out.append(f"{q}articles:")
        for a in n.articles:
            out.extend(ser_article(a, len(q) + 2))
    else:
        out.append(f"{q}articles: []")
    if n.enfants:
        out.append(f"{q}divisions:")
        for e in n.enfants:
            out.extend(ser_division(e, len(q) + 2))
    else:
        out.append(f"{q}divisions: []")
    return out


def compter(n):
    a = len(n.articles)
    d = len(n.enfants)
    for e in n.enfants:
        sa, sd = compter(e)
        a += sa
        d += sd
    return a, d


# --------------------------------------------------------------------------
# 6. Programme principal
# --------------------------------------------------------------------------

def main():
    OUT.mkdir(exist_ok=True)
    lignes = nettoyer(charger_corps())
    racine, articles, _ = parser(lignes)
    extraire_renvois(articles)
    anomalies = controler(articles)

    # --- fichiers de référence ---
    (OUT / "00_textes_normatifs.yaml").write_text("""# Textes normatifs -> table texte_normatif
textes_normatifs:
  - id: loi-87-010
    numero: "87-010"
    nature: loi
    intitule: "Loi portant Code de la famille"
    date_promulgation: 1987-08-01
    reference_jo: "J.O.Z., numéro spécial, août 1987"
    date_entree_vigueur: 1988-08-01
    commentaire: "Entrée en vigueur douze mois après promulgation (art. 935)."

  - id: loi-16-008
    numero: "16/008"
    nature: loi
    intitule: "Loi modifiant et complétant la Loi n° 87-010 du 1er août 1987 portant Code de la famille"
    date_promulgation: 2016-07-15
    reference_jo: "J.O.RDC, numéro spécial, 15 juillet 2016"
    date_entree_vigueur: 2016-07-15
    commentaire: "À vérifier contre le Journal officiel : la source utilisée est une compilation privée."

codes:
  - id: code-famille-rdc
    intitule: "Code de la famille"
    juridiction: "République Démocratique du Congo"
    texte_instituant: loi-87-010

sources_documentaires:
  - id: src-cdf-2017-pdf
    titre: "CDF_2017.pdf"
    editeur: "compilation privée, éditeur non identifié"
    nature_source: compilation
    est_officiel: false
    date_edition: 2018-02-25
    nombre_pages: 144
    avertissement: >-
      Le document porte une mention de non-responsabilité de son éditeur.
      Toute donnée importée depuis cette source doit être recoupée avec le
      Journal officiel avant usage juridique.
""", encoding="utf-8")

    (OUT / "00_types_division.yaml").write_text("""# Nomenclature -> table type_division
types_division:
  - id: livre
    libelle: Livre
    niveau: 1
  - id: titre
    libelle: Titre
    niveau: 2
  - id: chapitre
    libelle: Chapitre
    niveau: 3
  - id: section
    libelle: Section
    niveau: 4
  - id: sous_section
    libelle: Sous-section
    niveau: 5
  - id: paragraphe
    libelle: Paragraphe
    niveau: 6
  - id: subdivision
    libelle: Subdivision littérale
    niveau: 7
""", encoding="utf-8")

    # --- un fichier par livre ---
    manifest = []
    for i, livre in enumerate(racine.enfants, 1):
        na, nd = compter(livre)
        lignes_out = [
            f"# Livre {livre.numero} - {livre.intitule}",
            f"# Généré par parse_cdf.py depuis CDF_2017.pdf",
            "code: code-famille-rdc",
            "source: src-cdf-2017-pdf",
            "livre:",
            f"  numero: {yq(livre.numero)}",
            f"  intitule: {yq(livre.intitule)}",
            f"  ordre: {livre.ordre}",
            f"  chemin: {yq(livre.chemin)}",
            f"  nombre_articles: {na}",
            f"  nombre_divisions: {nd}",
        ]
        if livre.articles:
            lignes_out.append("  articles:")
            for a in livre.articles:
                lignes_out.extend(ser_article(a, 4))
        lignes_out.append("divisions:")
        for e in livre.enfants:
            lignes_out.extend(ser_division(e, 2))
        nom = f"livre_{i}.yaml"
        (OUT / nom).write_text("\n".join(lignes_out) + "\n", encoding="utf-8")
        prem = min((int(re.match(r'\d+', a['numero']).group())
                    for a in collecter(livre)), default=0)
        dern = max((int(re.match(r'\d+', a['numero']).group())
                    for a in collecter(livre)), default=0)
        manifest.append((nom, livre.numero, livre.intitule, na, nd, prem, dern))

    # --- anomalies ---
    al = ["# Anomalies détectées dans la source. Aucune n'a été corrigée",
          "# automatiquement : la décision appartient au juriste.",
          "anomalies:"]
    for an in anomalies:
        al.append(f"  - type: {an['type']}")
        for k, v in an.items():
            if k == "type":
                continue
            if isinstance(v, list):
                al.append(f"    {k}: [{', '.join(str(x) for x in v)}]")
            else:
                al.append(f"    {k}: {yq(v)}")
    (OUT / "99_anomalies.yaml").write_text("\n".join(al) + "\n", encoding="utf-8")

    # --- manifest ---
    ml = ["# Manifeste d'import — ordre de chargement recommandé",
          "ordre_import:",
          "  - 00_textes_normatifs.yaml",
          "  - 00_types_division.yaml"]
    for nom, *_ in manifest:
        ml.append(f"  - {nom}")
    ml.append("  - 99_anomalies.yaml")
    ml.append("livres:")
    for nom, num, tit, na, nd, prem, dern in manifest:
        ml.append(f"  - fichier: {nom}")
        ml.append(f"    numero: {yq(num)}")
        ml.append(f"    intitule: {yq(tit)}")
        ml.append(f"    articles: {na}")
        ml.append(f"    divisions: {nd}")
        ml.append(f"    plage_articles: {yq(f'{prem}-{dern}')}")
    ml.append(f"total_articles: {len(articles)}")
    ml.append(f"total_abroges: {sum(1 for a in articles if a['statut'] == 'abroge')}")
    (OUT / "manifest.yaml").write_text("\n".join(ml) + "\n", encoding="utf-8")

    # --- rapport console ---
    print(f"Articles extraits       : {len(articles)}")
    print(f"Articles abrogés (2016) : {sum(1 for a in articles if a['statut'] == 'abroge')}")
    print(f"Renvois internes        : {sum(len(a['renvois']) for a in articles)}")
    print(f"Anomalies               : {len(anomalies)}")
    for nom, num, tit, na, nd, prem, dern in manifest:
        print(f"  {nom:14s} Livre {num:<4s} art. {prem}-{dern:<4d} "
              f"{na:4d} articles, {nd:3d} divisions  {tit[:42]}")


def collecter(n):
    res = list(n.articles)
    for e in n.enfants:
        res.extend(collecter(e))
    return res


if __name__ == "__main__":
    main()
