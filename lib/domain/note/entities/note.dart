import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/todo_item.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todos: List3(emptyList()),
      );
}
