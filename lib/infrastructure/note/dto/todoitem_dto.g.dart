// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoitem_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todos _$$_TodosFromJson(Map json) => _$_Todos(
      id: json['id'] as String,
      name: json['name'] as String?,
      done: json['done'] as bool?,
    );

Map<String, dynamic> _$$_TodosToJson(_$_Todos instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };
