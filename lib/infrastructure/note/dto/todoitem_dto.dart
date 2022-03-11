// import 'package:flutter_ddd_concepts/domain/domain.dart';
// import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:flutter_ddd_concepts/domain/note/entities/todo_item_entity.dart';

// part 'todoitem_dto.freezed.dart';
// part 'todoitem_dto.g.dart';

// /// why [freezed] [data class] with [implements] keyword insted of [with],
// /// we are including reguler member function [ TodoItemEntity toDomain()] so we
// ///  need to change freed data class definition
// /// so [with] keyword --> [implements] &&
// /// add [const TodoItemDTO._();] constructor
// ///
// @freezed
// abstract class TodoItemDTO implements _$TodoItemDTO {
//   const TodoItemDTO._();

//   @JsonSerializable(explicitToJson: true, anyMap: true)
//   factory TodoItemDTO({
//     required String id,
//     required String name,
//     required bool done,
//   }) = _TodoItemDTO;

//   /// Entity in to DTO mapping
//   factory TodoItemDTO.fromDomain(Todos todoItemEntity) {
//     return TodoItemDTO(
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
//       id: todoItemEntity.id.getOrCrash(),
//       name: todoItemEntity.name.getOrCrash(),
//       done: todoItemEntity.done,
//     );
//   }

//   /// when ever we recive [todoItem] from [fireStore] or some other
//   /// sourse of data, they are comming as simple data like [String] [int] or
//   /// [bool]. And then our other layer of the app are going to want to
//   /// comunicate in terms of [Todos] not [TodoItemDTO]
//   /// and this conversion is DTO in to Entity [mapping]
//   Todos toDomain() {
//     return Todos(
//       id: UniqueIdObj.fromUniqueString(id: id),
//       name: TodoNameObj(name),
//       done: done,
//     );
//   }

//   factory TodoItemDTO.fromJson(Map<String, dynamic> json) =>
//       _$TodoItemDTOFromJson(json);
// }

// import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/todo_item_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'todoitem_dto.freezed.dart';
part 'todoitem_dto.g.dart';

// @freezed
// class Todos with _$Todos {
//   const Todos._();

//   @JsonSerializable(includeIfNull: false, anyMap: true)
//   factory Todos({
//     required String id,
//     required String name,
//     required bool done,
//   }) = _Todos;

//   factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

//   factory Todos.fromDomain(TodoEntity todoItemEntity) {
//     return Todos(
//       id: todoItemEntity.id.getOrCrash(),
//       name: todoItemEntity.name.getOrCrash(),
//       done: todoItemEntity.done,
//     );
//   }

//   TodoEntity toDomain() {
//     return TodoEntity(
//       id: UniqueIdObj.fromUniqueString(id: id),
//       name: TodoNameObj(name),
//       done: done,
//     );
//   }

//   // static List<Todos> fromJsonArray(List<dynamic> jsonParts) {
//   //   List<Todos> parts = [];

//   //   for (var jsonData in jsonParts) {
//   //     parts.add(Todos.fromJson(jsonData));
//   //   }

//   //   return parts;
//   // }

//   // map(Todos Function(dynamic i) param0) {}
// }
//!
@JsonSerializable()
class Todos {
  // @JsonKey(name: 'id')
  String id;
  // @JsonKey(name: 'name')
  String name;
  // @JsonKey(name: 'done')
  bool done;
  Todos({
    required this.id,
    required this.name,
    required this.done,
  });

  factory Todos.fromDomain(TodoEntity todoItemEntity) {
    return Todos(
      id: todoItemEntity.id.getOrCrash(),
      name: todoItemEntity.name.getOrCrash(),
      done: todoItemEntity.done,
    );
  }

  TodoEntity toDomain() {
    return TodoEntity(
      id: UniqueIdObj.fromUniqueString(id: id),
      name: TodoNameObj(name),
      done: done,
    );
  }

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  Map<String, dynamic> toJson() => _$TodosToJson(this);

  Todos copyWith({
    String? id,
    String? name,
    bool? done,
  }) {
    return Todos(
      id: id ?? this.id,
      name: name ?? this.name,
      done: done ?? this.done,
    );
  }
}
