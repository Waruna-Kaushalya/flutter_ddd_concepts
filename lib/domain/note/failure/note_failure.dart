import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_failure.freezed.dart';

@freezed
class NoteFailure with _$NoteFailure {
  const factory NoteFailure.unexpected() = _Unexpected;
  const factory NoteFailure.insufficientPermissions() =
      _InsufficientPermissions;
  const factory NoteFailure.unableToUpdate() = _UnableToUpdate;
}
