// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteEntityTearOff {
  const _$NoteEntityTearOff();

  _NoteEntity call(
      {required UniqueIdObj id,
      required NoteBodyObj body,
      required NoteColorObj color,
      required List3Obj<TodoItemEntity> todos}) {
    return _NoteEntity(
      id: id,
      body: body,
      color: color,
      todos: todos,
    );
  }
}

/// @nodoc
const $NoteEntity = _$NoteEntityTearOff();

/// @nodoc
mixin _$NoteEntity {
  UniqueIdObj get id => throw _privateConstructorUsedError;
  NoteBodyObj get body => throw _privateConstructorUsedError;
  NoteColorObj get color => throw _privateConstructorUsedError;
  List3Obj<TodoItemEntity> get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteEntityCopyWith<NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteEntityCopyWith<$Res> {
  factory $NoteEntityCopyWith(
          NoteEntity value, $Res Function(NoteEntity) then) =
      _$NoteEntityCopyWithImpl<$Res>;
  $Res call(
      {UniqueIdObj id,
      NoteBodyObj body,
      NoteColorObj color,
      List3Obj<TodoItemEntity> todos});
}

/// @nodoc
class _$NoteEntityCopyWithImpl<$Res> implements $NoteEntityCopyWith<$Res> {
  _$NoteEntityCopyWithImpl(this._value, this._then);

  final NoteEntity _value;
  // ignore: unused_field
  final $Res Function(NoteEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueIdObj,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as NoteBodyObj,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as NoteColorObj,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List3Obj<TodoItemEntity>,
    ));
  }
}

/// @nodoc
abstract class _$NoteEntityCopyWith<$Res> implements $NoteEntityCopyWith<$Res> {
  factory _$NoteEntityCopyWith(
          _NoteEntity value, $Res Function(_NoteEntity) then) =
      __$NoteEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueIdObj id,
      NoteBodyObj body,
      NoteColorObj color,
      List3Obj<TodoItemEntity> todos});
}

/// @nodoc
class __$NoteEntityCopyWithImpl<$Res> extends _$NoteEntityCopyWithImpl<$Res>
    implements _$NoteEntityCopyWith<$Res> {
  __$NoteEntityCopyWithImpl(
      _NoteEntity _value, $Res Function(_NoteEntity) _then)
      : super(_value, (v) => _then(v as _NoteEntity));

  @override
  _NoteEntity get _value => super._value as _NoteEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
  }) {
    return _then(_NoteEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueIdObj,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as NoteBodyObj,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as NoteColorObj,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List3Obj<TodoItemEntity>,
    ));
  }
}

/// @nodoc

class _$_NoteEntity extends _NoteEntity {
  const _$_NoteEntity(
      {required this.id,
      required this.body,
      required this.color,
      required this.todos})
      : super._();

  @override
  final UniqueIdObj id;
  @override
  final NoteBodyObj body;
  @override
  final NoteColorObj color;
  @override
  final List3Obj<TodoItemEntity> todos;

  @override
  String toString() {
    return 'NoteEntity(id: $id, body: $body, color: $color, todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.todos, todos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(todos));

  @JsonKey(ignore: true)
  @override
  _$NoteEntityCopyWith<_NoteEntity> get copyWith =>
      __$NoteEntityCopyWithImpl<_NoteEntity>(this, _$identity);
}

abstract class _NoteEntity extends NoteEntity {
  const factory _NoteEntity(
      {required UniqueIdObj id,
      required NoteBodyObj body,
      required NoteColorObj color,
      required List3Obj<TodoItemEntity> todos}) = _$_NoteEntity;
  const _NoteEntity._() : super._();

  @override
  UniqueIdObj get id;
  @override
  NoteBodyObj get body;
  @override
  NoteColorObj get color;
  @override
  List3Obj<TodoItemEntity> get todos;
  @override
  @JsonKey(ignore: true)
  _$NoteEntityCopyWith<_NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
