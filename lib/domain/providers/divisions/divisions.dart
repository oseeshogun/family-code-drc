import 'package:family_code/data/repositories/division_repository_impl.dart';
import 'package:family_code/domain/entities/division.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'divisions.g.dart';

/// Root divisions (the five "livres" of the Code de la famille).
@riverpod
Stream<List<DivisionEntity>> divisions(Ref ref) {
  final repository = ref.watch(divisionRepositoryProvider);
  return repository.streamRoots();
}

@riverpod
Stream<List<DivisionEntity>> childDivisions(Ref ref, int parentId) {
  final repository = ref.watch(divisionRepositoryProvider);
  return repository.streamByParent(parentId);
}
