import 'package:drift/drift.dart';
import 'package:family_code/data/local/tables/divisions.dart';

class Articles extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get divisionId => integer().references(Divisions, #id, onDelete: KeyAction.cascade)();

  TextColumn get numero => text()();

  RealColumn get numeroTri => real()();

  IntColumn get ordre => integer()();

  TextColumn get statut => text()();

  TextColumn get texteSource => text().nullable()();

  TextColumn get contenu => text()();

  TextColumn get contenuSlug => text()();

  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}
