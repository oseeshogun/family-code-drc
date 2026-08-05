// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(prefs)
final prefsProvider = PrefsProvider._();

final class PrefsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  PrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prefsHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return prefs(ref);
  }
}

String _$prefsHash() => r'90fd4950ea2da9ef5859e81b91b3d144dd48456f';

@ProviderFor(analytics)
final analyticsProvider = AnalyticsProvider._();

final class AnalyticsProvider
    extends
        $FunctionalProvider<
          FirebaseAnalytics,
          FirebaseAnalytics,
          FirebaseAnalytics
        >
    with $Provider<FirebaseAnalytics> {
  AnalyticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsHash();

  @$internal
  @override
  $ProviderElement<FirebaseAnalytics> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseAnalytics create(Ref ref) {
    return analytics(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAnalytics value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAnalytics>(value),
    );
  }
}

String _$analyticsHash() => r'47cf9b8c6cfdeb0575a4b7af6e68b07fec249b29';

@ProviderFor(analyticsObserver)
final analyticsObserverProvider = AnalyticsObserverProvider._();

final class AnalyticsObserverProvider
    extends
        $FunctionalProvider<
          FirebaseAnalyticsObserver,
          FirebaseAnalyticsObserver,
          FirebaseAnalyticsObserver
        >
    with $Provider<FirebaseAnalyticsObserver> {
  AnalyticsObserverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'analyticsObserverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$analyticsObserverHash();

  @$internal
  @override
  $ProviderElement<FirebaseAnalyticsObserver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseAnalyticsObserver create(Ref ref) {
    return analyticsObserver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAnalyticsObserver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAnalyticsObserver>(value),
    );
  }
}

String _$analyticsObserverHash() => r'c3fea056d1ac932abcec3edc87d10dbadaebed35';
