// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data_offline.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(registerDataOffline)
final registerDataOfflineProvider = RegisterDataOfflineProvider._();

final class RegisterDataOfflineProvider
    extends
        $FunctionalProvider<
          RegisterDataOnOfflineUseCase,
          RegisterDataOnOfflineUseCase,
          RegisterDataOnOfflineUseCase
        >
    with $Provider<RegisterDataOnOfflineUseCase> {
  RegisterDataOfflineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerDataOfflineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerDataOfflineHash();

  @$internal
  @override
  $ProviderElement<RegisterDataOnOfflineUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterDataOnOfflineUseCase create(Ref ref) {
    return registerDataOffline(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterDataOnOfflineUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterDataOnOfflineUseCase>(value),
    );
  }
}

String _$registerDataOfflineHash() =>
    r'99fe0624b23ad0b1556918c943fa06dbc1102cf4';
