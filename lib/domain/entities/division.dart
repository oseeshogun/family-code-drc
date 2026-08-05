import 'package:family_code/domain/entities/division_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'division.freezed.dart';

@freezed
abstract class DivisionEntity with _$DivisionEntity {
  const factory DivisionEntity({
    required int id,
    required DivisionType type,
    required String numero,
    required String intitule,
    required int ordre,
    required String chemin,
    required int? parentId,
  }) = _DivisionEntity;
}
