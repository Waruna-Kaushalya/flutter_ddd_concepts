import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/note_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/value_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../../domain/note/failure/note_failure.dart';
import '../../../presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc() : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) async {
      await event.map(
          initialized: (e) {
            emit(e.initialNoteOption.fold(
              // Yielding an unchanged state results in not emitting anything at all
              () => state,
              (initialNote) {
                return state.copyWith(
                  note: initialNote,
                  isEditing: true,
                );
              },
            ));
          },
          bodyChanged: (e) {
            emit(state.copyWith(
              note: state.note.copyWith(body: NoteBodyObj(e.bodyStr)),
              saveFailureOrSuccessOption: none(),
            ));
          },
          colorChanged: (e) {
            emit(state.copyWith(
              note: state.note.copyWith(color: NoteColorObj(e.color)),
              saveFailureOrSuccessOption: none(),
            ));
          },
          todosChanged: (e) {
            emit(state.copyWith(
              note: state.note.copyWith(
                todos: List3Obj(
                  e.todos.map((primitive) => primitive.toDomain()),
                ),
              ),
              saveFailureOrSuccessOption: none(),
            ));
          },
          saved: (value) {});
    });
  }
}
