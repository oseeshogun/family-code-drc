import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@riverpod
Stream<List<ArticleEntity>> allArticles(Ref ref) {
  final articleRepository = ref.watch(articleRepositoryProvider);
  return articleRepository.streamAll();
}

@riverpod
AsyncValue<List<ArticleEntity>> search(Ref ref, String query) {
  final allArticles = ref.watch(allArticlesProvider);
  if (query.isEmpty) {
    return AsyncValue.data([]);
  }
  if (query.split(',').every((i) => int.tryParse(i) != null)) {
    final numeros = query.split(',').map((i) => i.trim()).toList();
    return allArticles.when(
      data: (articles) => AsyncValue.data(articles.where((i) => numeros.contains(i.numero)).toList()),
      loading: () => AsyncValue.loading(),
      error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    );
  }
  return allArticles.when(
    data: (articles) {
      bool filter(ArticleEntity entry) {
        final name = '${entry.contenu} ${entry.slug}';
        final fuse = Fuzzy<String>([name]);

        return fuse.search(query).where((element) => element.score < 0.4).isNotEmpty;
      }
      return AsyncValue.data(articles.where(filter).toList());
    },
    loading: () => AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
  );
}
