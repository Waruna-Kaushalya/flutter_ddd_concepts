// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoEntityTearOff {
  const _$TodoEntityTearOff();

  _TodoEntity call(
      {required UniqueIdObj id,
      required TodoNameObj name,
      required bool done}) {
    return _TodoEntity(
      id: id,
      name: name,
      done: done,
    );
  }
}

/// @nodoc
const $TodoEntity = _$TodoEntityTearOff();

/// @nodoc
mixin _$TodoEntity {
  UniqueIdObj get id => throw _privateConstructorUsedError;
  TodoNameObj get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoEntityCopyWith<TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEntityCopyWith<$Res> {
  factory $TodoEntityCopyWith(
          TodoEntity value, $Res Function(TodoEntity) then) =
      _$TodoEntityCopyWithImpl<$Res>;
  $Res call({UniqueIdObj id, TodoNameObj name, bool done});
}

/// @nodoc
class _$TodoEntityCopyWithImpl<$Res> implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._value, this._then);

  final TodoEntity _value;
  // ignore: unused_field
  final $Res Function(TodoEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueIdObj,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TodoNameObj,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodoEntityCopyWith<$Res> implements $TodoEntityCopyWith<$Res> {
  factory _$TodoEntityCopyWith(
          _TodoEntity value, $Res Function(_TodoEntity) then) =
      __$TodoEntityCopyWithImpl<$Res>;
  @override
  $Res call({UniqueIdObj id, TodoNameObj name, bool done});
}

/// @nodoc
class __$TodoEntityCopyWithImpl<$Res> extends _$TodoEntityCopyWithImpl<$Res>
    implements _$TodoEntityCopyWith<$Res> {
  __$TodoEntityCopyWithImpl(
      _TodoEntity _value, $Res Function(_TodoEntity) _then)
      : super(_value, (v) => _then(v as _TodoEntity));

  @override
  _TodoEntity get _value => super._value as _TodoEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_TodoEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueIdObj,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TodoNameObj,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TodoEntity extends _TodoEntity {
  const _$_TodoEntity(
      {required this.id, required this.name, required this.done})
      : super._();

  @override
  final UniqueIdObj id;
  @override
  final TodoNameObj name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoEntity(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$TodoEntityCopyWith<_TodoEntity> get copyWith =>
      __$TodoEntityCopyWithImpl<_TodoEntity>(this, _$identity);
}

abstract class _TodoEntity extends TodoEntity {
  const factory _TodoEntity(
      {required UniqueIdObj id,
      required TodoNameObj name,
      required bool done}) = _$_TodoEntity;
  const _TodoEntity._() : super._();

  @override
  UniqueIdObj get id;
  @override
  TodoNameObj get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$TodoEntityCopyWith<_TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
