// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divisions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Root divisions (the five "livres" of the Code de la famille).

@ProviderFor(divisions)
final divisionsProvider = DivisionsProvider._();

/// Root divisions (the five "livres" of the Code de la famille).

final class DivisionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DivisionEntity>>,
          List<DivisionEntity>,
          Stream<List<DivisionEntity>>
        >
    with
        $FutureModifier<List<DivisionEntity>>,
        $StreamProvider<List<DivisionEntity>> {
  /// Root divisions (the five "livres" of the Code de la famille).
  DivisionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'divisionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$divisionsHash();

  @$internal
  @override
  $StreamProviderElement<List<DivisionEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DivisionEntity>> create(Ref ref) {
    return divisions(ref);
  }
}

String _$divisionsHash() => r'4299ec7a4cfbe9f643cb28ce9ca82daad84bb84b';

@ProviderFor(childDivisions)
final childDivisionsProvider = ChildDivisionsFamily._();

final class ChildDivisionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DivisionEntity>>,
          List<DivisionEntity>,
          Stream<List<DivisionEntity>>
        >
    with
        $FutureModifier<List<DivisionEntity>>,
        $StreamProvider<List<DivisionEntity>> {
  ChildDivisionsProvider._({
    required ChildDivisionsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'childDivisionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$childDivisionsHash();

  @override
  String toString() {
    return r'childDivisionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<DivisionEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DivisionEntity>> create(Ref ref) {
    final argument = this.argument as int;
    return childDivisions(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ChildDivisionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$childDivisionsHash() => r'6d2002eab16bc4019b34750b6eef47bae0fea981';

final class ChildDivisionsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<DivisionEntity>>, int> {
  ChildDivisionsFamily._()
    : super(
        retry: null,
        name: r'childDivisionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChildDivisionsProvider call(int parentId) =>
      ChildDivisionsProvider._(argument: parentId, from: this);

  @override
  String toString() => r'childDivisionsProvider';
}
