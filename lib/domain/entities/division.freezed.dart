// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'division.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DivisionEntity {

 int get id; DivisionType get type; String get numero; String get intitule; int get ordre; String get chemin; int? get parentId;
/// Create a copy of DivisionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DivisionEntityCopyWith<DivisionEntity> get copyWith => _$DivisionEntityCopyWithImpl<DivisionEntity>(this as DivisionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DivisionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.intitule, intitule) || other.intitule == intitule)&&(identical(other.ordre, ordre) || other.ordre == ordre)&&(identical(other.chemin, chemin) || other.chemin == chemin)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,numero,intitule,ordre,chemin,parentId);

@override
String toString() {
  return 'DivisionEntity(id: $id, type: $type, numero: $numero, intitule: $intitule, ordre: $ordre, chemin: $chemin, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $DivisionEntityCopyWith<$Res>  {
  factory $DivisionEntityCopyWith(DivisionEntity value, $Res Function(DivisionEntity) _then) = _$DivisionEntityCopyWithImpl;
@useResult
$Res call({
 int id, DivisionType type, String numero, String intitule, int ordre, String chemin, int? parentId
});




}
/// @nodoc
class _$DivisionEntityCopyWithImpl<$Res>
    implements $DivisionEntityCopyWith<$Res> {
  _$DivisionEntityCopyWithImpl(this._self, this._then);

  final DivisionEntity _self;
  final $Res Function(DivisionEntity) _then;

/// Create a copy of DivisionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? numero = null,Object? intitule = null,Object? ordre = null,Object? chemin = null,Object? parentId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DivisionType,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String,intitule: null == intitule ? _self.intitule : intitule // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,chemin: null == chemin ? _self.chemin : chemin // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DivisionEntity].
extension DivisionEntityPatterns on DivisionEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DivisionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DivisionEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DivisionEntity value)  $default,){
final _that = this;
switch (_that) {
case _DivisionEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DivisionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DivisionEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DivisionType type,  String numero,  String intitule,  int ordre,  String chemin,  int? parentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DivisionEntity() when $default != null:
return $default(_that.id,_that.type,_that.numero,_that.intitule,_that.ordre,_that.chemin,_that.parentId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DivisionType type,  String numero,  String intitule,  int ordre,  String chemin,  int? parentId)  $default,) {final _that = this;
switch (_that) {
case _DivisionEntity():
return $default(_that.id,_that.type,_that.numero,_that.intitule,_that.ordre,_that.chemin,_that.parentId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DivisionType type,  String numero,  String intitule,  int ordre,  String chemin,  int? parentId)?  $default,) {final _that = this;
switch (_that) {
case _DivisionEntity() when $default != null:
return $default(_that.id,_that.type,_that.numero,_that.intitule,_that.ordre,_that.chemin,_that.parentId);case _:
  return null;

}
}

}

/// @nodoc


class _DivisionEntity implements DivisionEntity {
  const _DivisionEntity({required this.id, required this.type, required this.numero, required this.intitule, required this.ordre, required this.chemin, required this.parentId});
  

@override final  int id;
@override final  DivisionType type;
@override final  String numero;
@override final  String intitule;
@override final  int ordre;
@override final  String chemin;
@override final  int? parentId;

/// Create a copy of DivisionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DivisionEntityCopyWith<_DivisionEntity> get copyWith => __$DivisionEntityCopyWithImpl<_DivisionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DivisionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.intitule, intitule) || other.intitule == intitule)&&(identical(other.ordre, ordre) || other.ordre == ordre)&&(identical(other.chemin, chemin) || other.chemin == chemin)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,numero,intitule,ordre,chemin,parentId);

@override
String toString() {
  return 'DivisionEntity(id: $id, type: $type, numero: $numero, intitule: $intitule, ordre: $ordre, chemin: $chemin, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$DivisionEntityCopyWith<$Res> implements $DivisionEntityCopyWith<$Res> {
  factory _$DivisionEntityCopyWith(_DivisionEntity value, $Res Function(_DivisionEntity) _then) = __$DivisionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, DivisionType type, String numero, String intitule, int ordre, String chemin, int? parentId
});




}
/// @nodoc
class __$DivisionEntityCopyWithImpl<$Res>
    implements _$DivisionEntityCopyWith<$Res> {
  __$DivisionEntityCopyWithImpl(this._self, this._then);

  final _DivisionEntity _self;
  final $Res Function(_DivisionEntity) _then;

/// Create a copy of DivisionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? numero = null,Object? intitule = null,Object? ordre = null,Object? chemin = null,Object? parentId = freezed,}) {
  return _then(_DivisionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DivisionType,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String,intitule: null == intitule ? _self.intitule : intitule // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,chemin: null == chemin ? _self.chemin : chemin // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
