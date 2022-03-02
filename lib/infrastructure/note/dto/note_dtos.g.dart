// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItemDTO _$$_TodoItemDTOFromJson(Map<String, dynamic> json) =>
    _$_TodoItemDTO(
      uniqueId: json['uniqueId'] as String,
      todoName: json['todoName'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$$_TodoItemDTOToJson(_$_TodoItemDTO instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'todoName': instance.todoName,
      'done': instance.done,
    };
