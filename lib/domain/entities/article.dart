import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
abstract class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    required int id,
    required int divisionId,
    required String numero,
    required double numeroTri,
    required int ordre,
    required String statut,
    required String? texteSource,
    required String contenu,
    required String slug,
    @Default(false) bool isFavorite,
  }) = _ArticleEntity;
}
