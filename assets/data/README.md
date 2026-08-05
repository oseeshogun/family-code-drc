# Code de la famille de la RDC — jeu de données d'import

Extraction structurée de `CDF_2017.pdf` (Loi n° 87-010 du 1er août 1987 portant Code
de la famille, consolidée par la Loi n° 16/008 du 15 juillet 2016), alignée sur le
modèle conceptuel `texte_normatif / code / division / article / version_article /
alinea / renvoi / source_documentaire`.

## Contenu

| Fichier | Rôle | Cible en base |
|---|---|---|
| `manifest.yaml` | ordre de chargement, volumétrie par livre | — |
| `00_textes_normatifs.yaml` | les deux lois, le code, la source documentaire | `texte_normatif`, `code`, `source_documentaire` |
| `00_types_division.yaml` | nomenclature des niveaux hiérarchiques | `type_division` |
| `livre_1.yaml` … `livre_5.yaml` | arborescence complète + articles | `division`, `article`, `version_article`, `alinea`, `renvoi` |
| `99_anomalies.yaml` | défauts de la source, non corrigés | table de contrôle / revue juridique |

## Volumétrie

| Livre | Intitulé | Articles | Divisions | Plage |
|---|---|---|---|---|
| I | De la nationalité | 53 | 29 | 1–53 |
| II | De la personne | 272 | 65 | 56–327 |
| III | De la famille | 432 | 85 | 327–754 |
| IV | Des successions et des libéralités | 162 | 33 | 755–914 |
| V | Dispositions abrogatoires, transitoires et finales | 23 | 3 | 915–935 |
| | **Total** | **942** | **215** | |

942 articles pour 935 numéros : l'écart vient de 8 articles suffixés (`651 bis`,
`653 bis`, `668 bis`, `691 bis`, `811 bis`, `811 ter`, `920 bis`, `923 bis`), de
l'absence des numéros 54 et 55, et d'un article 327 présent deux fois.

26 articles portent `statut: abroge` avec `texte_source: loi-16-008`.

## Structure d'un article

```yaml
- numero: "361"
  numero_tri: 361.0          # 361 bis -> 361.1, insertion sans renumérotation
  ordre: 360                 # rang d'apparition dans le PDF
  version:
    num_version: 1
    statut: en_vigueur       # en_vigueur | abroge
    texte_source: null       # null = indéterminé (voir ci-dessous)
    date_debut_vigueur: null
    date_fin_vigueur: null
    contenu: |-
      ...
    alineas:
      - ordre: 1
        type: alinea         # alinea | point | tiret
        contenu: ...
    renvois:
      - article_cible: "330"
        portee: interne      # interne | externe_ou_introuvable
```

## Limites assumées

**`texte_source` est à `null` pour les articles en vigueur.** Le PDF signale les
abrogations de 2016 mais pas les modifications. Impossible, à partir de cette seule
source, de dire si un article en vigueur porte le texte de 1987 ou celui de 2016.
Le champ reste vide plutôt que faux ; il se remplit par confrontation au Journal
officiel du 15 juillet 2016.

**Le bloc 327–329 est mal placé dans la source.** Le PDF interrompt l'article 327 en
milieu de phrase à la fin du Livre II, puis réinsère les articles 327, 328 et 329
complets après l'article 336, en plein Livre III. Ces trois articles portent
`rattachement_suspect: true` et doivent être rerattachés au Livre II, Titre II,
Chapitre IV, Section II (Des conséquences de l'autorité parentale), avant import
définitif.

**La source n'est pas officielle.** Le PDF est une compilation privée dont l'éditeur
décline toute responsabilité. `source_documentaire.est_officiel` vaut `false` et
chaque version d'article devrait, à terme, porter une seconde localisation pointant
vers le Journal officiel.

## Régénération

```bash
pdftotext CDF_2017.pdf brut.txt
python3 parse_cdf.py
```

Aucune dépendance externe (bibliothèque standard uniquement). `pyyaml` sert
seulement à valider les sorties.
