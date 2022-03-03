import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_ddd_concepts/domain/note/entities/note_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/repository/i_note_repository.dart';

import '../../../domain/note/failure/note_failure.dart';

part 'note_actor_bloc.freezed.dart';
part 'note_actor_event.dart';
part 'note_actor_state.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _iNoteRepository;
  NoteActorBloc(
    this._iNoteRepository,
  ) : super(const NoteActorState.initial()) {
    on<NoteActorEvent>((event, emit) async {
      await event.map(
        deleted: (value) async {
          const NoteActorState.loading();
          final possibleFailures =
              await _iNoteRepository.delete(value.noteEntity);
          emit(
            possibleFailures.fold(
              (failure) => NoteActorState.failure(failure),
              (_) => const NoteActorState.success(),
            ),
          );
        },
      );
    });
  }
}
