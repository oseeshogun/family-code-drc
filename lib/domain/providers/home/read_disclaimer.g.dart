// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_disclaimer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(readDisclaimer)
final readDisclaimerProvider = ReadDisclaimerProvider._();

final class ReadDisclaimerProvider
    extends
        $FunctionalProvider<
          AsyncValue<bool>,
          AsyncValue<bool>,
          AsyncValue<bool>
        >
    with $Provider<AsyncValue<bool>> {
  ReadDisclaimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readDisclaimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readDisclaimerHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<bool>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AsyncValue<bool> create(Ref ref) {
    return readDisclaimer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool>>(value),
    );
  }
}

String _$readDisclaimerHash() => r'f8aa707a9a5efa0c75367f4d80f5ab1c1544c80f';
