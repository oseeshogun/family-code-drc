// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allArticles)
final allArticlesProvider = AllArticlesProvider._();

final class AllArticlesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ArticleEntity>>,
          List<ArticleEntity>,
          Stream<List<ArticleEntity>>
        >
    with
        $FutureModifier<List<ArticleEntity>>,
        $StreamProvider<List<ArticleEntity>> {
  AllArticlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allArticlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allArticlesHash();

  @$internal
  @override
  $StreamProviderElement<List<ArticleEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ArticleEntity>> create(Ref ref) {
    return allArticles(ref);
  }
}

String _$allArticlesHash() => r'cbf37e241e2bb722f03591f6826fc1b7315becd7';

@ProviderFor(search)
final searchProvider = SearchFamily._();

final class SearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ArticleEntity>>,
          AsyncValue<List<ArticleEntity>>,
          AsyncValue<List<ArticleEntity>>
        >
    with $Provider<AsyncValue<List<ArticleEntity>>> {
  SearchProvider._({
    required SearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchHash();

  @override
  String toString() {
    return r'searchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<List<ArticleEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<ArticleEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return search(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<ArticleEntity>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<ArticleEntity>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchHash() => r'3d219606eb63cb9319edf5ba2724c799d28fd5d2';

final class SearchFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<ArticleEntity>>, String> {
  SearchFamily._()
    : super(
        retry: null,
        name: r'searchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchProvider call(String query) =>
      SearchProvider._(argument: query, from: this);

  @override
  String toString() => r'searchProvider';
}
