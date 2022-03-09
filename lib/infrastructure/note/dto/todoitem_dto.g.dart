// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoitem_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDTO _$TodoDTOFromJson(Map json) => TodoDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$TodoDTOToJson(TodoDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };
