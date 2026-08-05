// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoriteArticles)
final favoriteArticlesProvider = FavoriteArticlesProvider._();

final class FavoriteArticlesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ArticleEntity>>,
          List<ArticleEntity>,
          Stream<List<ArticleEntity>>
        >
    with
        $FutureModifier<List<ArticleEntity>>,
        $StreamProvider<List<ArticleEntity>> {
  FavoriteArticlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteArticlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteArticlesHash();

  @$internal
  @override
  $StreamProviderElement<List<ArticleEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ArticleEntity>> create(Ref ref) {
    return favoriteArticles(ref);
  }
}

String _$favoriteArticlesHash() => r'37a4463e7829741bf7eeb7912582474beed5cb8f';

@ProviderFor(article)
final articleProvider = ArticleFamily._();

final class ArticleProvider
    extends
        $FunctionalProvider<
          AsyncValue<ArticleEntity>,
          ArticleEntity,
          Stream<ArticleEntity>
        >
    with $FutureModifier<ArticleEntity>, $StreamProvider<ArticleEntity> {
  ArticleProvider._({
    required ArticleFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'articleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$articleHash();

  @override
  String toString() {
    return r'articleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<ArticleEntity> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ArticleEntity> create(Ref ref) {
    final argument = this.argument as int;
    return article(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$articleHash() => r'954bb517f06ea61ef45e6a9dd594a5fe1b6cb860';

final class ArticleFamily extends $Family
    with $FunctionalFamilyOverride<Stream<ArticleEntity>, int> {
  ArticleFamily._()
    : super(
        retry: null,
        name: r'articleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ArticleProvider call(int id) => ArticleProvider._(argument: id, from: this);

  @override
  String toString() => r'articleProvider';
}

@ProviderFor(articleCount)
final articleCountProvider = ArticleCountProvider._();

final class ArticleCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  ArticleCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articleCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articleCountHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return articleCount(ref);
  }
}

String _$articleCountHash() => r'd9b18f2a6aa97d7aee048c8d88a3bf8cdb1c2f11';

@ProviderFor(articlesByDivision)
final articlesByDivisionProvider = ArticlesByDivisionFamily._();

final class ArticlesByDivisionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ArticleEntity>>,
          List<ArticleEntity>,
          Stream<List<ArticleEntity>>
        >
    with
        $FutureModifier<List<ArticleEntity>>,
        $StreamProvider<List<ArticleEntity>> {
  ArticlesByDivisionProvider._({
    required ArticlesByDivisionFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'articlesByDivisionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$articlesByDivisionHash();

  @override
  String toString() {
    return r'articlesByDivisionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<ArticleEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ArticleEntity>> create(Ref ref) {
    final argument = this.argument as int;
    return articlesByDivision(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticlesByDivisionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$articlesByDivisionHash() =>
    r'603594b8d0ca8c172bb7fa2e5d1a57673f34001d';

final class ArticlesByDivisionFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<ArticleEntity>>, int> {
  ArticlesByDivisionFamily._()
    : super(
        retry: null,
        name: r'articlesByDivisionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ArticlesByDivisionProvider call(int divisionId) =>
      ArticlesByDivisionProvider._(argument: divisionId, from: this);

  @override
  String toString() => r'articlesByDivisionProvider';
}
