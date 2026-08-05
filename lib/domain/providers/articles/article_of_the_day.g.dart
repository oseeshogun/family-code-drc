// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_of_the_day.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(articleOfTheDayId)
final articleOfTheDayIdProvider = ArticleOfTheDayIdProvider._();

final class ArticleOfTheDayIdProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  ArticleOfTheDayIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articleOfTheDayIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articleOfTheDayIdHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return articleOfTheDayId(ref);
  }
}

String _$articleOfTheDayIdHash() => r'b2fdd5b9d720596757c667d642667705a5240ab2';

@ProviderFor(articleOfTheDay)
final articleOfTheDayProvider = ArticleOfTheDayProvider._();

final class ArticleOfTheDayProvider
    extends
        $FunctionalProvider<
          AsyncValue<ArticleEntity>,
          ArticleEntity,
          FutureOr<ArticleEntity>
        >
    with $FutureModifier<ArticleEntity>, $FutureProvider<ArticleEntity> {
  ArticleOfTheDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articleOfTheDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articleOfTheDayHash();

  @$internal
  @override
  $FutureProviderElement<ArticleEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ArticleEntity> create(Ref ref) {
    return articleOfTheDay(ref);
  }
}

String _$articleOfTheDayHash() => r'887967d63df2f3b563519e7f6f0fa2f16ba12636';

@ProviderFor(ArticleOfDayVisibility)
final articleOfDayVisibilityProvider = ArticleOfDayVisibilityProvider._();

final class ArticleOfDayVisibilityProvider
    extends $AsyncNotifierProvider<ArticleOfDayVisibility, bool> {
  ArticleOfDayVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articleOfDayVisibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articleOfDayVisibilityHash();

  @$internal
  @override
  ArticleOfDayVisibility create() => ArticleOfDayVisibility();
}

String _$articleOfDayVisibilityHash() =>
    r'1863af18087f3aa188305028e7295bed0b1538ad';

abstract class _$ArticleOfDayVisibility extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
