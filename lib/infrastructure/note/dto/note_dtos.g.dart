// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteDTO _$NoteDTOFromJson(Map json) => NoteDTO(
      body: json['body'] as String?,
      todos: (json['notes/todos'] as List<dynamic>?)
          ?.map((e) => Todos.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      color: json['color'] as int?,
      serverTimeStamp: const ServerTimestampConverter()
          .fromJson(json['serverTimeStamp'] as Object),
    );

Map<String, dynamic> _$NoteDTOToJson(NoteDTO instance) => <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'notes/todos': instance.todos?.map((e) => e.toJson()).toList(),
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
    };
