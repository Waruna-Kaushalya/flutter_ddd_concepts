import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/todo_item.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../../core/value_failures.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    required UniqueId uniqueId,
    required NoteBody noteBody,
    required NoteColor noteColor,
    required List3<TodoItem> todos,
  }) = _Note;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory Note.empty() => Note(
        uniqueId: UniqueId(),
        noteBody: NoteBody(''),
        noteColor: NoteColor(NoteColor.predefinedColors[0]),
        todos: List3(emptyList()),
      );

  /// note entity validation
  Option<ValueFailure<dynamic>> get failureOption {
    /// B fold<B>(B ifLeft(L l), B ifRight(R r));
    /// Option<A> some<A>(A a) => new Some(a);
    /// Option<A> none<A>() => new None();

    /// Option<A> optionOf<A>(A? value) => value != null ? some(value) : none();

    return noteBody.failureOrUnit
        .andThen(noteColor.failureOrUnit)
        .andThen(todos.failureOrUnit)
        .andThen(
          todos
              .getOrCrash()

              /// getting the failureOption from the todoItem ENTITY -
              /// NOT afailureOrUnit from a VALUE
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())

              /// if we can't get the 0thelement,the list is empty.
              /// In such a case,it's valid
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold((f) => some(f), (_) => none());
  }
}