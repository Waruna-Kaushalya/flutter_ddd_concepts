// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todoitem_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todos _$TodosFromJson(Map<String, dynamic> json) {
  return _Todos.fromJson(json);
}

/// @nodoc
class _$TodosTearOff {
  const _$TodosTearOff();

  _Todos call(
      {@JsonKey(name: 'id') required String id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'done') required bool done}) {
    return _Todos(
      id: id,
      name: name,
      done: done,
    );
  }

  Todos fromJson(Map<String, Object?> json) {
    return Todos.fromJson(json);
  }
}

/// @nodoc
const $Todos = _$TodosTearOff();

/// @nodoc
mixin _$Todos {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'done')
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodosCopyWith<Todos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosCopyWith<$Res> {
  factory $TodosCopyWith(Todos value, $Res Function(Todos) then) =
      _$TodosCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'done') bool done});
}

/// @nodoc
class _$TodosCopyWithImpl<$Res> implements $TodosCopyWith<$Res> {
  _$TodosCopyWithImpl(this._value, this._then);

  final Todos _value;
  // ignore: unused_field
  final $Res Function(Todos) _then;

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
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodosCopyWith<$Res> implements $TodosCopyWith<$Res> {
  factory _$TodosCopyWith(_Todos value, $Res Function(_Todos) then) =
      __$TodosCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'done') bool done});
}

/// @nodoc
class __$TodosCopyWithImpl<$Res> extends _$TodosCopyWithImpl<$Res>
    implements _$TodosCopyWith<$Res> {
  __$TodosCopyWithImpl(_Todos _value, $Res Function(_Todos) _then)
      : super(_value, (v) => _then(v as _Todos));

  @override
  _Todos get _value => super._value as _Todos;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_Todos(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(anyMap: true)
class _$_Todos extends _Todos {
  _$_Todos(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'done') required this.done})
      : super._();

  factory _$_Todos.fromJson(Map<String, dynamic> json) =>
      _$$_TodosFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'done')
  final bool done;

  @override
  String toString() {
    return 'Todos(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Todos &&
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
  _$TodosCopyWith<_Todos> get copyWith =>
      __$TodosCopyWithImpl<_Todos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodosToJson(this);
  }
}

abstract class _Todos extends Todos {
  factory _Todos(
      {@JsonKey(name: 'id') required String id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'done') required bool done}) = _$_Todos;
  _Todos._() : super._();

  factory _Todos.fromJson(Map<String, dynamic> json) = _$_Todos.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'done')
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$TodosCopyWith<_Todos> get copyWith => throw _privateConstructorUsedError;
}