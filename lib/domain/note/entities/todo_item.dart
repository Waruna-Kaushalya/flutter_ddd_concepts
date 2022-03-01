import 'package:flutter_ddd_concepts/domain/domain.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  // when open new page, need to siaply empty page.
  // so pre define the empty page state
  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );
}
