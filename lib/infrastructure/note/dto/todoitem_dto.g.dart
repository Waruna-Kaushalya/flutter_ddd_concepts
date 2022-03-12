// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoitem_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todos _$TodosFromJson(Map json) => Todos(
      id: json['notes/todos/id'] as String,
      name: json['notes/todos/name'] as String,
      done: json['notes/todos/done'] as bool,
    );

Map<String, dynamic> _$TodosToJson(Todos instance) => <String, dynamic>{
      'notes/todos/id': instance.id,
      'notes/todos/name': instance.name,
      'notes/todos/done': instance.done,
    };
