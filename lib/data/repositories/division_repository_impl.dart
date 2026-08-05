import 'package:family_code/data/local/database.dart';
import 'package:family_code/data/local/tables/divisions.dart';
import 'package:family_code/domain/entities/division.dart';
import 'package:family_code/domain/entities/division_type.dart';
import 'package:family_code/domain/repositories/division_repository.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'division_repository_impl.g.dart';

@Riverpod(keepAlive: true)
DivisionRepository divisionRepository(Ref ref) {
  final db = ref.watch(dbProvider);

  return DivisionRepositoryImpl(db);
}

@DriftAccessor(tables: [Divisions])
class DivisionRepositoryImpl extends DatabaseAccessor<AppDatabase> with _$DivisionRepositoryImplMixin, DivisionRepository {
  DivisionRepositoryImpl(super.attachedDatabase);

  @override
  Future<DivisionEntity> insert({
    required DivisionType type,
    required String numero,
    required String intitule,
    required int ordre,
    required String chemin,
    int? parentId,
  }) async {
    final row = await into(divisions).insertReturning(
      DivisionsCompanion.insert(
        type: type,
        numero: numero,
        intitule: intitule,
        ordre: ordre,
        chemin: chemin,
        parentId: Value(parentId),
      ),
    );
    return row.toEntity();
  }

  @override
  Stream<List<DivisionEntity>> streamRoots() {
    return (select(divisions)
          ..where((t) => t.parentId.isNull())
          ..orderBy([(t) => OrderingTerm.asc(t.ordre)]))
        .map((row) => row.toEntity())
        .watch();
  }

  @override
  Stream<List<DivisionEntity>> streamByParent(int parentId) {
    return (select(divisions)
          ..where((t) => t.parentId.equals(parentId))
          ..orderBy([(t) => OrderingTerm.asc(t.ordre)]))
        .map((row) => row.toEntity())
        .watch();
  }
}

extension DivisionToEntity on Division {
  DivisionEntity toEntity() {
    return DivisionEntity(
      id: id,
      type: type,
      numero: numero,
      intitule: intitule,
      ordre: ordre,
      chemin: chemin,
      parentId: parentId,
    );
  }
}
