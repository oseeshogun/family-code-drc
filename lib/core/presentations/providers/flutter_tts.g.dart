// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_tts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tts)
final ttsProvider = TtsProvider._();

final class TtsProvider
    extends
        $FunctionalProvider<
          AsyncValue<FlutterTts>,
          FlutterTts,
          FutureOr<FlutterTts>
        >
    with $FutureModifier<FlutterTts>, $FutureProvider<FlutterTts> {
  TtsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ttsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ttsHash();

  @$internal
  @override
  $FutureProviderElement<FlutterTts> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FlutterTts> create(Ref ref) {
    return tts(ref);
  }
}

String _$ttsHash() => r'28bf0d9e849d2e68c1a66e05251c9ad4e95455ea';
