// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentUserTearOff {
  const _$CurrentUserTearOff();

  _CurrentUser call({required UniqueId currentUserId}) {
    return _CurrentUser(
      currentUserId: currentUserId,
    );
  }
}

/// @nodoc
const $CurrentUser = _$CurrentUserTearOff();

/// @nodoc
mixin _$CurrentUser {
  UniqueId get currentUserId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentUserCopyWith<CurrentUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserCopyWith<$Res> {
  factory $CurrentUserCopyWith(
          CurrentUser value, $Res Function(CurrentUser) then) =
      _$CurrentUserCopyWithImpl<$Res>;
  $Res call({UniqueId currentUserId});
}

/// @nodoc
class _$CurrentUserCopyWithImpl<$Res> implements $CurrentUserCopyWith<$Res> {
  _$CurrentUserCopyWithImpl(this._value, this._then);

  final CurrentUser _value;
  // ignore: unused_field
  final $Res Function(CurrentUser) _then;

  @override
  $Res call({
    Object? currentUserId = freezed,
  }) {
    return _then(_value.copyWith(
      currentUserId: currentUserId == freezed
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$CurrentUserCopyWith<$Res>
    implements $CurrentUserCopyWith<$Res> {
  factory _$CurrentUserCopyWith(
          _CurrentUser value, $Res Function(_CurrentUser) then) =
      __$CurrentUserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId currentUserId});
}

/// @nodoc
class __$CurrentUserCopyWithImpl<$Res> extends _$CurrentUserCopyWithImpl<$Res>
    implements _$CurrentUserCopyWith<$Res> {
  __$CurrentUserCopyWithImpl(
      _CurrentUser _value, $Res Function(_CurrentUser) _then)
      : super(_value, (v) => _then(v as _CurrentUser));

  @override
  _CurrentUser get _value => super._value as _CurrentUser;

  @override
  $Res call({
    Object? currentUserId = freezed,
  }) {
    return _then(_CurrentUser(
      currentUserId: currentUserId == freezed
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_CurrentUser implements _CurrentUser {
  const _$_CurrentUser({required this.currentUserId});

  @override
  final UniqueId currentUserId;

  @override
  String toString() {
    return 'CurrentUser(currentUserId: $currentUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentUser &&
            const DeepCollectionEquality()
                .equals(other.currentUserId, currentUserId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentUserId));

  @JsonKey(ignore: true)
  @override
  _$CurrentUserCopyWith<_CurrentUser> get copyWith =>
      __$CurrentUserCopyWithImpl<_CurrentUser>(this, _$identity);
}

abstract class _CurrentUser implements CurrentUser {
  const factory _CurrentUser({required UniqueId currentUserId}) =
      _$_CurrentUser;

  @override
  UniqueId get currentUserId;
  @override
  @JsonKey(ignore: true)
  _$CurrentUserCopyWith<_CurrentUser> get copyWith =>
      throw _privateConstructorUsedError;
}
