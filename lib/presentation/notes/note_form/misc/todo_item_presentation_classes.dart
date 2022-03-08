import 'package:flutter_ddd_concepts/domain/note/entities/todo_item_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:flutter_ddd_concepts/domain/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_presentation_classes.freezed.dart';

@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    required UniqueIdObj id,
    required String name,
    required bool done,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueIdObj(),
        name: '',
        done: false,
      );

  factory TodoItemPrimitive.fromDomain(TodoItemEntity todoItemValue) =>
      TodoItemPrimitive(
        id: todoItemValue.id,
        // If we somehow get to this point, we missed something in other parts of the UI. It's better to throw an Error.
        name: todoItemValue.name.getOrCrash(),
        done: todoItemValue.done,
      );

  TodoItemEntity toDomain() {
    return TodoItemEntity(
      id: id,
      name: TodoNameObj(name),
      done: done,
    );
  }
}
