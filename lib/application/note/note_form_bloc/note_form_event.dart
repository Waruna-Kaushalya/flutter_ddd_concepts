part of 'note_form_bloc.dart';

@freezed
class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized(
      Option<NoteEntity> initialNoteOption) = _Initialized;
  const factory NoteFormEvent.bodyChanged(String bodyStr) = _BodyChanged;
  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;
  const factory NoteFormEvent.todosChanged(KtList<TodoItemPrimitive> todos) =
      _TodosChanged;
  const factory NoteFormEvent.saved() = _Saved;
}
