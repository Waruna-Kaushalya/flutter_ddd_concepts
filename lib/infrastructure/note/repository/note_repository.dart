import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/infrastructure/note/dto/note_dtos.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_ddd_concepts/domain/note/entities/note_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/failure/note_failure.dart';
import 'package:flutter_ddd_concepts/domain/note/repository/i_note_repository.dart';
import 'package:kt_dart/kt.dart';
import '../../core/firestore_helpers.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firebaseFirestore;
  NoteRepository(
    this._firebaseFirestore,
  );
  @override
  Stream<Either<NoteFailure, KtList<NoteEntity>>> watchAll() async* {
    final userDoc = await _firebaseFirestore.userDocument();

    userDoc.noteColletion
        .orderBy("serverTimeStamp", descending: true)
        .snapshots()
        .map((snapshot) => right(
              snapshot.docs
                  .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
                  .toImmutableList(),
            ));
    // userDoc.noteColletion
    //     .orderBy('serverTimeStamp', descending: true)
    //     .snapshots()
    //     .map(
    //       (snapshot) => right(
    //         snapshot.docs
    //             .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
    //             .toImmutableList(),
    //       ),
    //     );
    // userDoc.noteColletion

    //     /// order by "serverTimeStamp" {sort}
    //     .orderBy("serverTimeStamp", descending: true)
    //     .snapshots()

    //     /// [QuerySnapshot] map in to [Either<NoteFailure, KtList<NoteEntity>>]
    //     /// [map] function always recive corect data
    //     .map((snapshot) => right(
    //           /// [snapshot.docs] has List of QueryDocumentSnapshot
    //           snapshot.docs

    //               /// and we want to map [QueryDocumentSnapshot] in to [KtList] of NoteEntity
    //               .map((doc) => NoteDTO.fromFirestore(doc)

    //                   /// [NoteDTO] map to domain
    //                   .toDomain())
    //               .toImmutableList(),
    //         ));
  }

  @override
  Stream<Either<NoteFailure, KtList<NoteEntity>>> watchUncompleted() {
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> create(NoteEntity note) {
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(NoteEntity note) {
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> update(NoteEntity note) {
    throw UnimplementedError();
  }
}