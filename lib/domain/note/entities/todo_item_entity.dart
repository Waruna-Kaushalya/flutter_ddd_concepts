import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/core/value_failures.dart';
import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_entity.freezed.dart';

@freezed
abstract class TodoItemEntity implements _$TodoItemEntity {
  const TodoItemEntity._();

  const factory TodoItemEntity({
    required UniqueIdObj id,
    required TodoNameObj name,
    required bool done,
  }) = _TodoItemEntity;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory TodoItemEntity.empty() => TodoItemEntity(
        id: UniqueIdObj(),
        name: TodoNameObj(''),
        done: false,
      );

  /// [TodoItemEntity] entity validation
  Option<ValueFailure<dynamic>> get failureOption {
    /// if [failureOption] has some sort of failuer
    /// then return it [left] side as [some(failure)]
    /// otherwise evrything is valid then retun [none()]
    return name.value.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
