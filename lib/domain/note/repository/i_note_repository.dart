import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/note.dart';
import 'package:flutter_ddd_concepts/domain/note/failure/note_failure.dart';
import 'package:kt_dart/collection.dart';

/// interface
abstract class INoteRepository {
  /// [Read]
  /// watch note
  /// watch uncompleted notes
  ///
  /// [KtList]
  /// A generic ordered collection of elements. Methods in this
  /// interface support only read-only access to the list;
  /// read/write access is supported through the [KtMutableList] interface.
  /// @param [T] the type of elements contained in the list.
  ///  The list is covariant on its element type.
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();

  /// [Create] [Update] [Delete]
  /// we need to tell which kind of note we need to create, and
  /// note arivel from the Note creation form, so we need to pass in the
  /// [Note]
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
