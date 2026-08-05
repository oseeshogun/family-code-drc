// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_repository_impl.dart';

// ignore_for_file: type=lint
mixin _$ArticleRepositoryImplMixin on DatabaseAccessor<AppDatabase> {
  $DivisionsTable get divisions => attachedDatabase.divisions;
  $ArticlesTable get articles => attachedDatabase.articles;
  ArticleRepositoryImplManager get managers =>
      ArticleRepositoryImplManager(this);
}

class ArticleRepositoryImplManager {
  final _$ArticleRepositoryImplMixin _db;
  ArticleRepositoryImplManager(this._db);
  $$DivisionsTableTableManager get divisions =>
      $$DivisionsTableTableManager(_db.attachedDatabase, _db.divisions);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db.attachedDatabase, _db.articles);
}
