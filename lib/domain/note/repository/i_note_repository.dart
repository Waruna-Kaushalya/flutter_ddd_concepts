import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/note.dart';
import 'package:flutter_ddd_concepts/domain/note/failure/note_failure.dart';
import 'package:kt_dart/collection.dart';

abstract class INoteRepository {
  /// [Read]
  /// watch note
  /// watch uncompleted notes
  ///
  /// [Create] [Update] [Delete]

  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
