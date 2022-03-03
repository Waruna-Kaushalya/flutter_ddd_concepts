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
class _$TodoItemEntityTearOff {
  const _$TodoItemEntityTearOff();

  _TodoItemEntity call(
      {required UniqueIdObj id,
      required TodoNameObj name,
      required bool done}) {
    return _TodoItemEntity(
      id: id,
      name: name,
      done: done,
    );
  }
}

/// @nodoc
const $TodoItemEntity = _$TodoItemEntityTearOff();

/// @nodoc
mixin _$TodoItemEntity {
  UniqueIdObj get id => throw _privateConstructorUsedError;
  TodoNameObj get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoItemEntityCopyWith<TodoItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemEntityCopyWith<$Res> {
  factory $TodoItemEntityCopyWith(
          TodoItemEntity value, $Res Function(TodoItemEntity) then) =
      _$TodoItemEntityCopyWithImpl<$Res>;
  $Res call({UniqueIdObj id, TodoNameObj name, bool done});
}

/// @nodoc
class _$TodoItemEntityCopyWithImpl<$Res>
    implements $TodoItemEntityCopyWith<$Res> {
  _$TodoItemEntityCopyWithImpl(this._value, this._then);

  final TodoItemEntity _value;
  // ignore: unused_field
  final $Res Function(TodoItemEntity) _then;

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
abstract class _$TodoItemEntityCopyWith<$Res>
    implements $TodoItemEntityCopyWith<$Res> {
  factory _$TodoItemEntityCopyWith(
          _TodoItemEntity value, $Res Function(_TodoItemEntity) then) =
      __$TodoItemEntityCopyWithImpl<$Res>;
  @override
  $Res call({UniqueIdObj id, TodoNameObj name, bool done});
}

/// @nodoc
class __$TodoItemEntityCopyWithImpl<$Res>
    extends _$TodoItemEntityCopyWithImpl<$Res>
    implements _$TodoItemEntityCopyWith<$Res> {
  __$TodoItemEntityCopyWithImpl(
      _TodoItemEntity _value, $Res Function(_TodoItemEntity) _then)
      : super(_value, (v) => _then(v as _TodoItemEntity));

  @override
  _TodoItemEntity get _value => super._value as _TodoItemEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_TodoItemEntity(
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

class _$_TodoItemEntity extends _TodoItemEntity {
  const _$_TodoItemEntity(
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
    return 'TodoItemEntity(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoItemEntity &&
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
  _$TodoItemEntityCopyWith<_TodoItemEntity> get copyWith =>
      __$TodoItemEntityCopyWithImpl<_TodoItemEntity>(this, _$identity);
}

abstract class _TodoItemEntity extends TodoItemEntity {
  const factory _TodoItemEntity(
      {required UniqueIdObj id,
      required TodoNameObj name,
      required bool done}) = _$_TodoItemEntity;
  const _TodoItemEntity._() : super._();

  @override
  UniqueIdObj get id;
  @override
  TodoNameObj get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$TodoItemEntityCopyWith<_TodoItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
