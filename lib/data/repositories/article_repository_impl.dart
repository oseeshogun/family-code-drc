import 'package:family_code/data/local/database.dart';
import 'package:family_code/data/local/tables/articles.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:family_code/domain/repositories/article_repository.dart';
import 'package:diacritic/diacritic.dart';
import 'package:drift/drift.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_repository_impl.g.dart';

@Riverpod(keepAlive: true)
ArticleRepository articleRepository(Ref ref) {
  final db = ref.watch(dbProvider);

  return ArticleRepositoryImpl(db);
}

@DriftAccessor(tables: [Articles])
class ArticleRepositoryImpl extends DatabaseAccessor<AppDatabase> with _$ArticleRepositoryImplMixin, ArticleRepository {
  ArticleRepositoryImpl(super.attachedDatabase);

  @override
  Future<void> insertAll(List<ArticleEntity> entries) {
    final rows = entries.map(
      (entry) => ArticlesCompanion.insert(
        divisionId: entry.divisionId,
        numero: entry.numero,
        numeroTri: entry.numeroTri,
        ordre: entry.ordre,
        statut: entry.statut,
        texteSource: Value(entry.texteSource),
        contenu: entry.contenu,
        contenuSlug: removeDiacritics(entry.contenu.toLowerCase().toSlug),
      ),
    );
    return batch((batch) {
      batch.insertAll(articles, rows);
    });
  }

  @override
  Stream<ArticleEntity> streamArticleById(int id) {
    return (select(articles)..where((t) => t.id.equals(id))).map((row) => row.toEntity()).watchSingle();
  }

  @override
  Future<ArticleEntity> getArticleById(int id) async {
    final result = await (select(articles)..where((t) => t.id.equals(id))).map((row) => row.toEntity()).getSingle();
    return result;
  }

  @override
  Stream<int> articlesCount() {
    final count = articles.id.count();
    return (selectOnly(articles)..addColumns([count])).map((row) => row.read(count) ?? 0).watchSingle();
  }

  @override
  Stream<List<ArticleEntity>> streamAll() {
    return (select(articles)..orderBy([(t) => OrderingTerm.asc(t.id)])).map((row) => row.toEntity()).watch();
  }

  @override
  Stream<List<ArticleEntity>> streamByDivision(int divisionId) {
    return (select(articles)
          ..where((t) => t.divisionId.equals(divisionId))
          ..orderBy([(t) => OrderingTerm.asc(t.ordre)]))
        .map((row) => row.toEntity())
        .watch();
  }

  @override
  Future<void> toggleArticleToFavorite(int id) {
    return (update(articles)..where(
      (t) => t.id.equals(id),
    )).write(ArticlesCompanion.custom(isFavorite: articles.isFavorite.not()));
  }

  @override
  Stream<List<ArticleEntity>> streamFavoriteArticles() {
    return (select(articles)..where((t) => t.isFavorite.equals(true))).map((row) => row.toEntity()).watch();
  }
}

extension ArticleToEntity on Article {
  ArticleEntity toEntity() {
    return ArticleEntity(
      id: id,
      divisionId: divisionId,
      numero: numero,
      numeroTri: numeroTri,
      ordre: ordre,
      statut: statut,
      texteSource: texteSource,
      contenu: contenu,
      slug: contenuSlug,
      isFavorite: isFavorite,
    );
  }
}
