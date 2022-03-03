part of 'note_actor_bloc.dart';

/// [Delete] note
@freezed
class NoteActorState with _$NoteActorState {
  const factory NoteActorState.initial() = _Initial;
  const factory NoteActorState.loading() = _Loading;
  const factory NoteActorState.success() = _Success;
  const factory NoteActorState.failure(NoteFailure noteFailure) = _Failure;
}
