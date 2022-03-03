import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/todo_item_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../../core/value_failures.dart';

part 'note_entity.freezed.dart';

@freezed
abstract class NoteEntity implements _$NoteEntity {
  const NoteEntity._();

  const factory NoteEntity({
    required UniqueIdObj id,
    required NoteBodyObj body,
    required NoteColorObj color,
    required List3Obj<TodoItemEntity> todos,
  }) = _NoteEntity;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory NoteEntity.empty() => NoteEntity(
        id: UniqueIdObj(),
        body: NoteBodyObj(''),
        color: NoteColorObj(NoteColorObj.predefinedColors[0]),

        /// Returns an empty read-only list.
        /// KtList<T> emptyList<T>() => KtList<T>.empty();
        todos: List3Obj(emptyList()),
      );

  /// note entity validation
  Option<ValueFailure<dynamic>> get failureOption {
    /// B fold<B>(B ifLeft(L l), B ifRight(R r));
    /// Option<A> some<A>(A a) => new Some(a);
    /// Option<A> none<A>() => new None();

    /// Option<A> optionOf<A>(A? value) => value != null ? some(value) : none();
    return body.failureOrUnit
        .andThen(color.failureOrUnit)
        .andThen(todos.failureOrUnit)
        .andThen(
          todos
              .getOrCrash()

              /// getting the failureOption from the todoItem ENTITY -
              /// NOT a failureOrUnit from a VALUE
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())

              /// if we can't get the 0 thelement,the list is empty.
              /// In such a case,it's valid
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (failure) => left(failure)),
        )
        .fold((f) => some(f), (_) => none());
  }
}
