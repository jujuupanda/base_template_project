// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterResponseEntity {

 String get id; String get username;
/// Create a copy of RegisterResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseEntityCopyWith<RegisterResponseEntity> get copyWith => _$RegisterResponseEntityCopyWithImpl<RegisterResponseEntity>(this as RegisterResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'RegisterResponseEntity(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class $RegisterResponseEntityCopyWith<$Res>  {
  factory $RegisterResponseEntityCopyWith(RegisterResponseEntity value, $Res Function(RegisterResponseEntity) _then) = _$RegisterResponseEntityCopyWithImpl;
@useResult
$Res call({
 String id, String username
});




}
/// @nodoc
class _$RegisterResponseEntityCopyWithImpl<$Res>
    implements $RegisterResponseEntityCopyWith<$Res> {
  _$RegisterResponseEntityCopyWithImpl(this._self, this._then);

  final RegisterResponseEntity _self;
  final $Res Function(RegisterResponseEntity) _then;

/// Create a copy of RegisterResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterResponseEntity].
extension RegisterResponseEntityPatterns on RegisterResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResponseEntity() when $default != null:
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username)  $default,) {final _that = this;
switch (_that) {
case _RegisterResponseEntity():
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResponseEntity() when $default != null:
return $default(_that.id,_that.username);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterResponseEntity implements RegisterResponseEntity {
  const _RegisterResponseEntity({required this.id, required this.username});
  

@override final  String id;
@override final  String username;

/// Create a copy of RegisterResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseEntityCopyWith<_RegisterResponseEntity> get copyWith => __$RegisterResponseEntityCopyWithImpl<_RegisterResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponseEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'RegisterResponseEntity(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseEntityCopyWith<$Res> implements $RegisterResponseEntityCopyWith<$Res> {
  factory _$RegisterResponseEntityCopyWith(_RegisterResponseEntity value, $Res Function(_RegisterResponseEntity) _then) = __$RegisterResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String username
});




}
/// @nodoc
class __$RegisterResponseEntityCopyWithImpl<$Res>
    implements _$RegisterResponseEntityCopyWith<$Res> {
  __$RegisterResponseEntityCopyWithImpl(this._self, this._then);

  final _RegisterResponseEntity _self;
  final $Res Function(_RegisterResponseEntity) _then;

/// Create a copy of RegisterResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,}) {
  return _then(_RegisterResponseEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
