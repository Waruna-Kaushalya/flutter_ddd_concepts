// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDTO _$NoteDTOFromJson(Map<String, dynamic> json) {
  return _NoteDTO.fromJson(json);
}

/// @nodoc
class _$NoteDTOTearOff {
  const _$NoteDTOTearOff();

  _NoteDTO call(
      {@JsonKey(ignore: true, name: "id")
          String? id,
      @JsonKey(name: 'body')
          required String body,
      @JsonKey(name: 'color')
          required int color,
      @JsonKey(name: 'todos')
          required List<Todos> todos,
      @JsonKey(name: 'serverTimeStamp')
      @ServerTimestampConverter()
          required FieldValue serverTimeStamp}) {
    return _NoteDTO(
      id: id,
      body: body,
      color: color,
      todos: todos,
      serverTimeStamp: serverTimeStamp,
    );
  }

  NoteDTO fromJson(Map<String, Object?> json) {
    return NoteDTO.fromJson(json);
  }
}

/// @nodoc
const $NoteDTO = _$NoteDTOTearOff();

/// @nodoc
mixin _$NoteDTO {
  @JsonKey(ignore: true, name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  int get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'todos')
  List<Todos> get todos => throw _privateConstructorUsedError;
  @JsonKey(name: 'serverTimeStamp')
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDTOCopyWith<NoteDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDTOCopyWith<$Res> {
  factory $NoteDTOCopyWith(NoteDTO value, $Res Function(NoteDTO) then) =
      _$NoteDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true, name: "id")
          String? id,
      @JsonKey(name: 'body')
          String body,
      @JsonKey(name: 'color')
          int color,
      @JsonKey(name: 'todos')
          List<Todos> todos,
      @JsonKey(name: 'serverTimeStamp')
      @ServerTimestampConverter()
          FieldValue serverTimeStamp});
}

/// @nodoc
class _$NoteDTOCopyWithImpl<$Res> implements $NoteDTOCopyWith<$Res> {
  _$NoteDTOCopyWithImpl(this._value, this._then);

  final NoteDTO _value;
  // ignore: unused_field
  final $Res Function(NoteDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todos>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$NoteDTOCopyWith<$Res> implements $NoteDTOCopyWith<$Res> {
  factory _$NoteDTOCopyWith(_NoteDTO value, $Res Function(_NoteDTO) then) =
      __$NoteDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true, name: "id")
          String? id,
      @JsonKey(name: 'body')
          String body,
      @JsonKey(name: 'color')
          int color,
      @JsonKey(name: 'todos')
          List<Todos> todos,
      @JsonKey(name: 'serverTimeStamp')
      @ServerTimestampConverter()
          FieldValue serverTimeStamp});
}

/// @nodoc
class __$NoteDTOCopyWithImpl<$Res> extends _$NoteDTOCopyWithImpl<$Res>
    implements _$NoteDTOCopyWith<$Res> {
  __$NoteDTOCopyWithImpl(_NoteDTO _value, $Res Function(_NoteDTO) _then)
      : super(_value, (v) => _then(v as _NoteDTO));

  @override
  _NoteDTO get _value => super._value as _NoteDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_NoteDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todos>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$_NoteDTO extends _NoteDTO {
  _$_NoteDTO(
      {@JsonKey(ignore: true, name: "id")
          this.id,
      @JsonKey(name: 'body')
          required this.body,
      @JsonKey(name: 'color')
          required this.color,
      @JsonKey(name: 'todos')
          required this.todos,
      @JsonKey(name: 'serverTimeStamp')
      @ServerTimestampConverter()
          required this.serverTimeStamp})
      : super._();

  factory _$_NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDTOFromJson(json);

  @override
  @JsonKey(ignore: true, name: "id")
  final String? id;
  @override
  @JsonKey(name: 'body')
  final String body;
  @override
  @JsonKey(name: 'color')
  final int color;
  @override
  @JsonKey(name: 'todos')
  final List<Todos> todos;
  @override
  @JsonKey(name: 'serverTimeStamp')
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'NoteDTO(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            const DeepCollectionEquality()
                .equals(other.serverTimeStamp, serverTimeStamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(todos),
      const DeepCollectionEquality().hash(serverTimeStamp));

  @JsonKey(ignore: true)
  @override
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      __$NoteDTOCopyWithImpl<_NoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDTOToJson(this);
  }
}

abstract class _NoteDTO extends NoteDTO {
  factory _NoteDTO(
      {@JsonKey(ignore: true, name: "id")
          String? id,
      @JsonKey(name: 'body')
          required String body,
      @JsonKey(name: 'color')
          required int color,
      @JsonKey(name: 'todos')
          required List<Todos> todos,
      @JsonKey(name: 'serverTimeStamp')
      @ServerTimestampConverter()
          required FieldValue serverTimeStamp}) = _$_NoteDTO;
  _NoteDTO._() : super._();

  factory _NoteDTO.fromJson(Map<String, dynamic> json) = _$_NoteDTO.fromJson;

  @override
  @JsonKey(ignore: true, name: "id")
  String? get id;
  @override
  @JsonKey(name: 'body')
  String get body;
  @override
  @JsonKey(name: 'color')
  int get color;
  @override
  @JsonKey(name: 'todos')
  List<Todos> get todos;
  @override
  @JsonKey(name: 'serverTimeStamp')
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}