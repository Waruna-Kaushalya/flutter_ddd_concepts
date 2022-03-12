// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoitem_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todos _$TodosFromJson(Map json) => Todos(
      id: json['todos/id'] as String,
      name: json['todos/name'] as String,
      done: json['todos/done'] as bool,
    );

Map<String, dynamic> _$TodosToJson(Todos instance) => <String, dynamic>{
      'todos/id': instance.id,
      'todos/name': instance.name,
      'todos/done': instance.done,
    };
