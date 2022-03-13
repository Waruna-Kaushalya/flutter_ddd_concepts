// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteDTO _$NoteDTOFromJson(Map json) => NoteDTO(
      body: json['body'] as String,
      color: json['color'] as int,
      todos: _convertVaccinations(json),
      serverTimeStamp: const ServerTimestampConverter()
          .fromJson(json['serverTimeStamp'] as Object),
    );

Map<String, dynamic> _$NoteDTOToJson(NoteDTO instance) => <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'todos': instance.todos.map((e) => e.toJson()).toList(),
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
    };

List<Todos> _convertVaccinations(Map<dynamic, dynamic> vaccinationMap) {
  Map<dynamic, dynamic> todos = vaccinationMap['todos'] as Map;

  List<Todos> todolist = [];

  todos.forEach((key, value) {
    todolist.add(Todos(
      id: todos['id'] as String,
      name: todos['name'] as String,
      done: todos['done'] as bool,
    ));
  });

  return todolist;
}
