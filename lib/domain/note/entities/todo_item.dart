import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/core/value_failures.dart';
import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
  const TodoItem._();

  const factory TodoItem({
    required UniqueId uniqueId,
    required TodoName todoName,
    required bool done,
  }) = _TodoItem;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory TodoItem.empty() => TodoItem(
        uniqueId: UniqueId(),
        todoName: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    /// Option<A> optionOf<A>(A? value) => value != null ? some(value) : none();
    return todoName.value.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
