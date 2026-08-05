/// Mirrors the `types_division` nomenclature in
/// `assets/data/00_types_division.yaml` (niveaux 1 à 7).
enum DivisionType {
  livre,
  titre,
  chapitre,
  section,
  sousSection,
  paragraphe,
  subdivision;

  /// Parses the raw snake_case `type` value found in the livre_*.yaml source.
  static DivisionType fromYaml(String raw) {
    switch (raw) {
      case 'livre':
        return DivisionType.livre;
      case 'titre':
        return DivisionType.titre;
      case 'chapitre':
        return DivisionType.chapitre;
      case 'section':
        return DivisionType.section;
      case 'sous_section':
        return DivisionType.sousSection;
      case 'paragraphe':
        return DivisionType.paragraphe;
      case 'subdivision':
        return DivisionType.subdivision;
      default:
        throw ArgumentError('Type de division inconnu: $raw');
    }
  }

  String get libelle => switch (this) {
    DivisionType.livre => 'Livre',
    DivisionType.titre => 'Titre',
    DivisionType.chapitre => 'Chapitre',
    DivisionType.section => 'Section',
    DivisionType.sousSection => 'Sous-section',
    DivisionType.paragraphe => 'Paragraphe',
    DivisionType.subdivision => 'Subdivision',
  };
}
