import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/core/value_failures.dart';
import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_entity.freezed.dart';

@freezed
abstract class TodoEntity implements _$TodoEntity {
  const TodoEntity._();

  // @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory TodoEntity({
    required UniqueIdObj id,
    required TodoNameObj name,
    required bool done,
  }) = _TodoEntity;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory TodoEntity.empty() => TodoEntity(
        id: UniqueIdObj(),
        name: TodoNameObj(''),
        done: false,
      );

  /// [TodoEntity] entity validation
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
