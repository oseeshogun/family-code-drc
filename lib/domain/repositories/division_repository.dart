import 'package:family_code/domain/entities/division.dart';
import 'package:family_code/domain/entities/division_type.dart';

mixin DivisionRepository {
  Future<DivisionEntity> insert({
    required DivisionType type,
    required String numero,
    required String intitule,
    required int ordre,
    required String chemin,
    int? parentId,
  });

  Stream<List<DivisionEntity>> streamRoots();

  Stream<List<DivisionEntity>> streamByParent(int parentId);
}
