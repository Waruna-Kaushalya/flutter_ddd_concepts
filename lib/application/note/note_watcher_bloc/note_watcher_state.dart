part of 'note_watcher_bloc.dart';

@freezed
class NoteWatcherState with _$NoteWatcherState {
  const factory NoteWatcherState.initial() = _Initial;
  const factory NoteWatcherState.loading() = _Loading;
  const factory NoteWatcherState.success(KtList<NoteEntity> notes) = _Success;
  const factory NoteWatcherState.failure(NoteFailure noteFailure) = _Failure;
}
