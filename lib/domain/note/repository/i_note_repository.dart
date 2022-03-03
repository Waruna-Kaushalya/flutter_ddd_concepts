import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/note/entities/note_entity.dart';
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
  Stream<Either<NoteFailure, KtList<NoteEntity>>> watchAll();
  Stream<Either<NoteFailure, KtList<NoteEntity>>> watchUncompleted();

  /// [Create] [Update] [Delete]
  /// we need to tell which kind of note we need to create, and
  /// note arivel from the Note creation form, so we need to pass in the
  /// [NoteEntity]
  Future<Either<NoteFailure, Unit>> create(NoteEntity note);
  Future<Either<NoteFailure, Unit>> update(NoteEntity note);
  Future<Either<NoteFailure, Unit>> delete(NoteEntity note);
}
