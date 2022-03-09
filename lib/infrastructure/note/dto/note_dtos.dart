// import 'dart:ui';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'package:flutter_ddd_concepts/domain/domain.dart';
// import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';

// import 'package:kt_dart/kt.dart';

// import '../../../domain/note/entities/note_entity.dart';
// import 'todoitem_dto.dart';

// part 'note_dtos.freezed.dart';
// part 'note_dtos.g.dart';

// /// why [freezed] [data class] with [implements] keyword insted of [with],
// /// we are including reguler member function [ NoteEntity toDomain()] so we
// ///  need to change freed data class definition
// /// so [with] keyword --> [implements] &&
// /// add [ const NoteDTO._();] constructor

// @freezed
// abstract class NoteDTO implements _$NoteDTO {
//   const NoteDTO._();

//   @JsonSerializable(explicitToJson: true, anyMap: true)
//   factory NoteDTO({
//     @JsonKey(ignore: true) String? id,
//     required String body,
//     required int color,
//     @JsonKey(name: 'todos') required List<TodoItemDTO> todos,

//     /// we need to sort [NoteDTO] acrding to time note is created
//     /// so [serverTimeStamp] is use for get note created time
//     ///Placeholder --> Time on the server when note is created or updated
//     ///
//     /// [ServerTimestampConverter()]
//     /// [JasonSerializable] can convert by default only fields which are
//     /// valid jsons. those are [String] [int] [bool] .., so on
//     /// thats whay we need to convert [FieldValue]
//     @ServerTimestampConverter() required FieldValue serverTimeStamp,
//   }) = _NoteDTO;

//   /// Entity in to DTO mapping
//   factory NoteDTO.fromDomain(NoteEntity noteEntity) {
//     return NoteDTO(
//       /// why [getOrCrash()] used in here
//       /// beause [noteEntity.id] is [UniqueIdObj] type and
//       /// [id] is [String] type. so The argument type 'UniqueIdObj' can't be
//       /// assigned to the parameter type 'String?'.
//       ///
//       /// so [getOrCrash()] fold the [UniqueIdObj] and, if it validated one,
//       /// then return [String] type value.
//       ///
//       /// {but in this point value is already validated}
//       ///
//       /// [return value.fold((f) => throw UnexpectedValueError(f), id);]
//       id: noteEntity.id.getOrCrash(),
//       body: noteEntity.body.getOrCrash(),

//       /// [value] --> A 32 bit value representing this color.
//       color: noteEntity.color.getOrCrash().value,

//       /// [ noteEntity.todos] is not a reguler List and it's [List3Obj]
//       /// List of 3 which hold [TodoItem].
//       /// so we need to convert [List3Obj] and [TodoItemEntity] to reguler
//       /// data types
//       todos: noteEntity.todos
//           .getOrCrash()
//           .map(
//             /// convert [todoItemEntity] whcich are held in [KtList]
//             /// in to just reguler [TodoItemDTO]
//             (todoItemEntity) => TodoItemDTO.fromDomain(todoItemEntity),
//           )

//           /// and we don't need to store [KtList] in the todos [List]
//           /// so convert it [asList()]
//           .asList(),
//       serverTimeStamp: FieldValue.serverTimestamp(),
//     );
//   }

//   /// when ever we recive [Note] from [fireStore] or some other
//   /// sourse of data, they are comming as simple data like [String] [int] or
//   /// [bool]. And then our other layer of the app are going to want to
//   /// comunicate in terms of [NoteEntity] not [NoteDTO]
//   /// and this conversion is DTO in to Entity [mapping]
//   /// [NoteDTO] --> [NoteEntity]
//   NoteEntity toDomain() {
//     return NoteEntity(
//       id: UniqueIdObj.fromUniqueString(id: id!),
//       body: NoteBodyObj(body),
//       color: NoteColorObj(Color(color)),
//       todos: List3Obj(todos

//           /// we need to map [TodoItemDTO] in to [Entities]
//           /// [TodoItemEntity toDomain()]
//           .map((todoItemDTO) => todoItemDTO.toDomain())

//           /// now we need to convert this simple list in to [KtList]
//           .toImmutableList()),
//     );
//   }

//   factory NoteDTO.fromJson(Map<String, dynamic> json) =>
//       _$NoteDTOFromJson(json);

//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.

//   /// in addition [fromJson] this [NoteDTO] whcich is going to be store
//   /// inside [firestore]. se we gretly benifit when we haveing  [fromFirestore]
//   /// method. it is very similer to [fromJson] and it use [fromJson].
//   /// but it will know about one more thing....
//   /// about the [id] of the [firestore] document
//   factory NoteDTO.fromFirestore(DocumentSnapshot doc) {
//     /// [doc.data()]
//     /// Map<String, dynamic>? data()
//     /// Contains all the data of this document snapshot.

//     // Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
//     return NoteDTO.fromJson(doc.data()! as Map<String, dynamic>)
//         .copyWith(id: doc.id);

//     // Map<String,dynamic>.from(mapValue)
//     // return NoteDTO(
//     //   id: doc.id,
//     //   body: doc['body'] as String,
//     //   color: doc['color'] as int,
//     //   todos: (doc['todos'] as List<dynamic>)
//     //       .map(
//     //         (e) => TodoItemDTO(
//     //           id: doc['id'] as String,
//     //           name: doc['name'] as String,
//     //           done: doc['done'] as bool,
//     //         ),
//     //       )
//     //       .toList(),
//     //   // todos: (doc['todos'] as List)
//     //   //     ?.map((e) => e == null
//     //   //         ? null
//     //   //         : TodoItemDto.fromJson(e as Map<String, dynamic>))
//     //   //     ?.toList(),
//     //   serverTimeStamp: const ServerTimestampConverter()
//     //       .fromJson(doc['serverTimeStamp'] as Object),
//     // );
//   }
// }

// /// [ServerTimestampConverter()]
// /// [JasonSerializable] can convert by default only fields which are
// /// valid jsons. those are [String] [int] [bool] .., so on
// /// thats whay we need to convert [FieldValue]
// class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
//   /// we need to const constructor if we use this as annotation
//   const ServerTimestampConverter();
//   @override
//   FieldValue fromJson(Object json) {
//     return FieldValue.serverTimestamp();
//   }

//   @override
//   Object toJson(FieldValue fieldValue) => fieldValue;
// }

import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';

import '../../../domain/note/entities/note_entity.dart';
import 'todoitem_dto.dart';

// part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

// @freezed
// abstract class NoteDTO implements _$NoteDTO {
//   const NoteDTO._();

//   @JsonSerializable(explicitToJson: true, anyMap: true)
//   factory NoteDTO({
//     @JsonKey(ignore: true, name: "id") String? id,
//     @JsonKey(name: 'body') required String body,
//     @JsonKey(name: 'color') required int color,
//     @JsonKey(name: 'todos') required List<TodoDTO> todos,
//     @JsonKey(name: 'serverTimeStamp')
//     @ServerTimestampConverter()
//         required FieldValue serverTimeStamp,
//   }) = _NoteDTO;

//   factory NoteDTO.fromDomain(NoteEntity noteEntity) {
//     return NoteDTO(
//       id: noteEntity.id.getOrCrash(),
//       body: noteEntity.body.getOrCrash(),
//       color: noteEntity.color.getOrCrash().value,
//       serverTimeStamp: FieldValue.serverTimestamp(),
//       todos: noteEntity.todos
//           .getOrCrash()
//           .map(
//             (todoItemEntity) => TodoDTO.fromDomain(todoItemEntity),
//           )
//           .asList(),
//     );
//   }

//   NoteEntity toDomain() {
//     return NoteEntity(
//       id: UniqueIdObj.fromUniqueString(id: id!),
//       body: NoteBodyObj(body),
//       color: NoteColorObj(Color(color)),
//       todos: List3Obj(
//           todos.map((todoItemDTO) => todoItemDTO.toDomain()).toImmutableList()),
//     );
//   }

//   factory NoteDTO.fromJson(Map<String, dynamic> json) =>
//       _$NoteDTOFromJson(json);

//   factory NoteDTO.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data()! as Map<String, dynamic>;

//     return NoteDTO.fromJson(data).copyWith(id: doc.id);
//   }
// }

@JsonSerializable(explicitToJson: true, anyMap: true)
class Notes {
  @JsonKey(ignore: true, name: "id")
  final String? id;
  @JsonKey(name: 'body')
  final String body;
  @JsonKey(name: 'color')
  final int color;
  @JsonKey(name: 'todos')
  final List<Todos> todos;
  @JsonKey(name: 'serverTimeStamp')
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  Notes({
    this.id,
    required this.body,
    required this.color,
    required this.todos,
    required this.serverTimeStamp,
  });

  factory Notes.fromDomain(NoteEntity noteEntity) {
    return Notes(
      id: noteEntity.id.getOrCrash(),
      body: noteEntity.body.getOrCrash(),
      color: noteEntity.color.getOrCrash().value,
      serverTimeStamp: FieldValue.serverTimestamp(),
      todos: noteEntity.todos
          .getOrCrash()
          .map(
            (todoItemEntity) => Todos.fromDomain(todoItemEntity),
          )
          .asList(),
    );
  }

  NoteEntity toDomain() {
    return NoteEntity(
      id: UniqueIdObj.fromUniqueString(id: id!),
      body: NoteBodyObj(body),
      color: NoteColorObj(Color(color)),
      todos: List3Obj(
          todos.map((todoItemDTO) => todoItemDTO.toDomain()).toImmutableList()),
    );
  }

  factory Notes.fromJson(Map json) => _$NotesFromJson(json);

  Map<String, dynamic> toJson() => _$NotesToJson(this);

  factory Notes.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    print(data);

    return Notes.fromJson(data).copyWith(id: doc.id);
  }

  Notes copyWith({
    String? id,
    String? body,
    int? color,
    List<Todos>? todos,
    FieldValue? serverTimeStamp,
  }) {
    return Notes(
      id: id ?? this.id,
      body: body ?? this.body,
      color: color ?? this.color,
      todos: todos ?? this.todos,
      serverTimeStamp: serverTimeStamp ?? this.serverTimeStamp,
    );
  }
}

//!

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();
  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
