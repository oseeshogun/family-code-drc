import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article.g.dart';

@riverpod
Stream<List<ArticleEntity>> favoriteArticles(Ref ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return repository.streamFavoriteArticles();
}

@riverpod
Stream<ArticleEntity> article(Ref ref, int id) {
  final repository = ref.watch(articleRepositoryProvider);
  return repository.streamArticleById(id);
}

@riverpod
Stream<int> articleCount(Ref ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return repository.articlesCount();
}

@riverpod
Stream<List<ArticleEntity>> articlesByDivision(Ref ref, int divisionId) {
  final repository = ref.watch(articleRepositoryProvider);
  return repository.streamByDivision(divisionId);
}
