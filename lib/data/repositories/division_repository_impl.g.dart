// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division_repository_impl.dart';

// ignore_for_file: type=lint
mixin _$DivisionRepositoryImplMixin on DatabaseAccessor<AppDatabase> {
  $DivisionsTable get divisions => attachedDatabase.divisions;
  DivisionRepositoryImplManager get managers =>
      DivisionRepositoryImplManager(this);
}

class DivisionRepositoryImplManager {
  final _$DivisionRepositoryImplMixin _db;
  DivisionRepositoryImplManager(this._db);
  $$DivisionsTableTableManager get divisions =>
      $$DivisionsTableTableManager(_db.attachedDatabase, _db.divisions);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(divisionRepository)
final divisionRepositoryProvider = DivisionRepositoryProvider._();

final class DivisionRepositoryProvider
    extends
        $FunctionalProvider<
          DivisionRepository,
          DivisionRepository,
          DivisionRepository
        >
    with $Provider<DivisionRepository> {
  DivisionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'divisionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$divisionRepositoryHash();

  @$internal
  @override
  $ProviderElement<DivisionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DivisionRepository create(Ref ref) {
    return divisionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DivisionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DivisionRepository>(value),
    );
  }
}

String _$divisionRepositoryHash() =>
    r'9298223e7bfc6a39189aed7dabad2a5e2d0a9ba1';
