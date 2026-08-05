import 'package:family_code/domain/entities/article.dart';

mixin ArticleRepository {
  Future<void> insertAll(List<ArticleEntity> entries);

  Stream<List<ArticleEntity>> streamAll();

  Stream<List<ArticleEntity>> streamByDivision(int divisionId);

  Stream<ArticleEntity> streamArticleById(int id);

  Future<ArticleEntity> getArticleById(int id);

  Stream<int> articlesCount();

  Future<void> toggleArticleToFavorite(int id);

  Stream<List<ArticleEntity>> streamFavoriteArticles();
}
