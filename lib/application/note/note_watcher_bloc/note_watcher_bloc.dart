import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import 'package:flutter_ddd_concepts/domain/note/failure/note_failure.dart';
import 'package:flutter_ddd_concepts/domain/note/repository/i_note_repository.dart';

import '../../../domain/note/entities/note_entity.dart';

part 'note_watcher_bloc.freezed.dart';
part 'note_watcher_event.dart';
part 'note_watcher_state.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _iNoteRepository;
  late StreamSubscription<Either<NoteFailure, KtList<NoteEntity>>>
      _noteStreamSubscription;

  NoteWatcherBloc(
    this._iNoteRepository,
  ) : super(const NoteWatcherState.initial()) {
    on<NoteWatcherEvent>((event, emit) async {
      await event.map(
        watchAllStarted: (value) {
          emit(const NoteWatcherState.loading());
          _noteStreamSubscription =
              _iNoteRepository.watchAll().listen((failureOrNotes) {
            add(NoteWatcherEvent.notesReceived(failureOrNotes));
          });
        },
        watchUncompletedStarted: (value) {},
        notesReceived: (e) {
          e.failureOrNotes.fold(
            (failure) => NoteWatcherState.failure(failure),
            (notes) => NoteWatcherState.success(notes),
          );
        },
      );
    });
  }
}
