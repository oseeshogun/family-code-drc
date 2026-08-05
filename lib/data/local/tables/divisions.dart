import 'package:drift/drift.dart';
import 'package:family_code/domain/entities/division_type.dart';

class Divisions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get type => textEnum<DivisionType>()();

  TextColumn get numero => text()();

  TextColumn get intitule => text()();

  IntColumn get ordre => integer()();

  TextColumn get chemin => text()();

  IntColumn get parentId => integer().nullable().references(Divisions, #id, onDelete: KeyAction.cascade)();
}
