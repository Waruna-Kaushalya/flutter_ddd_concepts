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

TodoDTO _$TodoDTOFromJson(Map<String, dynamic> json) {
  return _TodsDTO.fromJson(json);
}

/// @nodoc
class _$TodoDTOTearOff {
  const _$TodoDTOTearOff();

  _TodsDTO call(
      {@JsonKey(name: 'id') required String id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'done') required bool done}) {
    return _TodsDTO(
      id: id,
      name: name,
      done: done,
    );
  }

  TodoDTO fromJson(Map<String, Object?> json) {
    return TodoDTO.fromJson(json);
  }
}

/// @nodoc
const $TodoDTO = _$TodoDTOTearOff();

/// @nodoc
mixin _$TodoDTO {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'done')
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoDTOCopyWith<TodoDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoDTOCopyWith<$Res> {
  factory $TodoDTOCopyWith(TodoDTO value, $Res Function(TodoDTO) then) =
      _$TodoDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'done') bool done});
}

/// @nodoc
class _$TodoDTOCopyWithImpl<$Res> implements $TodoDTOCopyWith<$Res> {
  _$TodoDTOCopyWithImpl(this._value, this._then);

  final TodoDTO _value;
  // ignore: unused_field
  final $Res Function(TodoDTO) _then;

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
abstract class _$TodsDTOCopyWith<$Res> implements $TodoDTOCopyWith<$Res> {
  factory _$TodsDTOCopyWith(_TodsDTO value, $Res Function(_TodsDTO) then) =
      __$TodsDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'done') bool done});
}

/// @nodoc
class __$TodsDTOCopyWithImpl<$Res> extends _$TodoDTOCopyWithImpl<$Res>
    implements _$TodsDTOCopyWith<$Res> {
  __$TodsDTOCopyWithImpl(_TodsDTO _value, $Res Function(_TodsDTO) _then)
      : super(_value, (v) => _then(v as _TodsDTO));

  @override
  _TodsDTO get _value => super._value as _TodsDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_TodsDTO(
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

@JsonSerializable(anyMap: true, explicitToJson: true, nullable: false)
class _$_TodsDTO extends _TodsDTO {
  _$_TodsDTO(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'done') required this.done})
      : super._();

  factory _$_TodsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TodsDTOFromJson(json);

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
    return 'TodoDTO(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodsDTO &&
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
  _$TodsDTOCopyWith<_TodsDTO> get copyWith =>
      __$TodsDTOCopyWithImpl<_TodsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodsDTOToJson(this);
  }
}

abstract class _TodsDTO extends TodoDTO {
  factory _TodsDTO(
      {@JsonKey(name: 'id') required String id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'done') required bool done}) = _$_TodsDTO;
  _TodsDTO._() : super._();

  factory _TodsDTO.fromJson(Map<String, dynamic> json) = _$_TodsDTO.fromJson;

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
  _$TodsDTOCopyWith<_TodsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
