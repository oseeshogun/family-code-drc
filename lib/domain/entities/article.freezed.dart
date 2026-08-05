// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArticleEntity {

 int get id; int get divisionId; String get numero; double get numeroTri; int get ordre; String get statut; String? get texteSource; String get contenu; String get slug; bool get isFavorite;
/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleEntityCopyWith<ArticleEntity> get copyWith => _$ArticleEntityCopyWithImpl<ArticleEntity>(this as ArticleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionId, divisionId) || other.divisionId == divisionId)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.numeroTri, numeroTri) || other.numeroTri == numeroTri)&&(identical(other.ordre, ordre) || other.ordre == ordre)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.texteSource, texteSource) || other.texteSource == texteSource)&&(identical(other.contenu, contenu) || other.contenu == contenu)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,id,divisionId,numero,numeroTri,ordre,statut,texteSource,contenu,slug,isFavorite);

@override
String toString() {
  return 'ArticleEntity(id: $id, divisionId: $divisionId, numero: $numero, numeroTri: $numeroTri, ordre: $ordre, statut: $statut, texteSource: $texteSource, contenu: $contenu, slug: $slug, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $ArticleEntityCopyWith<$Res>  {
  factory $ArticleEntityCopyWith(ArticleEntity value, $Res Function(ArticleEntity) _then) = _$ArticleEntityCopyWithImpl;
@useResult
$Res call({
 int id, int divisionId, String numero, double numeroTri, int ordre, String statut, String? texteSource, String contenu, String slug, bool isFavorite
});




}
/// @nodoc
class _$ArticleEntityCopyWithImpl<$Res>
    implements $ArticleEntityCopyWith<$Res> {
  _$ArticleEntityCopyWithImpl(this._self, this._then);

  final ArticleEntity _self;
  final $Res Function(ArticleEntity) _then;

/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? divisionId = null,Object? numero = null,Object? numeroTri = null,Object? ordre = null,Object? statut = null,Object? texteSource = freezed,Object? contenu = null,Object? slug = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionId: null == divisionId ? _self.divisionId : divisionId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String,numeroTri: null == numeroTri ? _self.numeroTri : numeroTri // ignore: cast_nullable_to_non_nullable
as double,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as String,texteSource: freezed == texteSource ? _self.texteSource : texteSource // ignore: cast_nullable_to_non_nullable
as String?,contenu: null == contenu ? _self.contenu : contenu // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleEntity].
extension ArticleEntityPatterns on ArticleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleEntity value)  $default,){
final _that = this;
switch (_that) {
case _ArticleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int divisionId,  String numero,  double numeroTri,  int ordre,  String statut,  String? texteSource,  String contenu,  String slug,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
return $default(_that.id,_that.divisionId,_that.numero,_that.numeroTri,_that.ordre,_that.statut,_that.texteSource,_that.contenu,_that.slug,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int divisionId,  String numero,  double numeroTri,  int ordre,  String statut,  String? texteSource,  String contenu,  String slug,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _ArticleEntity():
return $default(_that.id,_that.divisionId,_that.numero,_that.numeroTri,_that.ordre,_that.statut,_that.texteSource,_that.contenu,_that.slug,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int divisionId,  String numero,  double numeroTri,  int ordre,  String statut,  String? texteSource,  String contenu,  String slug,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
return $default(_that.id,_that.divisionId,_that.numero,_that.numeroTri,_that.ordre,_that.statut,_that.texteSource,_that.contenu,_that.slug,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _ArticleEntity implements ArticleEntity {
  const _ArticleEntity({required this.id, required this.divisionId, required this.numero, required this.numeroTri, required this.ordre, required this.statut, required this.texteSource, required this.contenu, required this.slug, this.isFavorite = false});
  

@override final  int id;
@override final  int divisionId;
@override final  String numero;
@override final  double numeroTri;
@override final  int ordre;
@override final  String statut;
@override final  String? texteSource;
@override final  String contenu;
@override final  String slug;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleEntityCopyWith<_ArticleEntity> get copyWith => __$ArticleEntityCopyWithImpl<_ArticleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.divisionId, divisionId) || other.divisionId == divisionId)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.numeroTri, numeroTri) || other.numeroTri == numeroTri)&&(identical(other.ordre, ordre) || other.ordre == ordre)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.texteSource, texteSource) || other.texteSource == texteSource)&&(identical(other.contenu, contenu) || other.contenu == contenu)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,id,divisionId,numero,numeroTri,ordre,statut,texteSource,contenu,slug,isFavorite);

@override
String toString() {
  return 'ArticleEntity(id: $id, divisionId: $divisionId, numero: $numero, numeroTri: $numeroTri, ordre: $ordre, statut: $statut, texteSource: $texteSource, contenu: $contenu, slug: $slug, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ArticleEntityCopyWith<$Res> implements $ArticleEntityCopyWith<$Res> {
  factory _$ArticleEntityCopyWith(_ArticleEntity value, $Res Function(_ArticleEntity) _then) = __$ArticleEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int divisionId, String numero, double numeroTri, int ordre, String statut, String? texteSource, String contenu, String slug, bool isFavorite
});




}
/// @nodoc
class __$ArticleEntityCopyWithImpl<$Res>
    implements _$ArticleEntityCopyWith<$Res> {
  __$ArticleEntityCopyWithImpl(this._self, this._then);

  final _ArticleEntity _self;
  final $Res Function(_ArticleEntity) _then;

/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? divisionId = null,Object? numero = null,Object? numeroTri = null,Object? ordre = null,Object? statut = null,Object? texteSource = freezed,Object? contenu = null,Object? slug = null,Object? isFavorite = null,}) {
  return _then(_ArticleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,divisionId: null == divisionId ? _self.divisionId : divisionId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String,numeroTri: null == numeroTri ? _self.numeroTri : numeroTri // ignore: cast_nullable_to_non_nullable
as double,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as String,texteSource: freezed == texteSource ? _self.texteSource : texteSource // ignore: cast_nullable_to_non_nullable
as String?,contenu: null == contenu ? _self.contenu : contenu // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
