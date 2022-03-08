// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_ddd_concepts/infrastructure/note/dto/note_dtos.dart';
// import 'package:injectable/injectable.dart';

// import 'package:flutter_ddd_concepts/domain/note/entities/note_entity.dart';
// import 'package:flutter_ddd_concepts/domain/note/failure/note_failure.dart';
// import 'package:flutter_ddd_concepts/domain/note/repository/i_note_repository.dart';
// import 'package:kt_dart/kt.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../core/firestore_helpers.dart';

// @LazySingleton(as: INoteRepository)
// class NoteRepository implements INoteRepository {
//   final FirebaseFirestore _firebaseFirestore;
//   NoteRepository(
//     this._firebaseFirestore,
//   );
//   @override
//   Stream<Either<NoteFailure, KtList<NoteEntity>>> watchAll() async* {
//     final userDoc = await _firebaseFirestore.userDocument();

//     yield* userDoc
//         .collection("notes")

//         /// order by "serverTimeStamp" {sort}
//         .orderBy("serverTimeStamp", descending: true)
//         .snapshots()

//         /// [QuerySnapshot] map in to [Either<NoteFailure, KtList<NoteEntity>>]
//         /// [map] function always recive corect data
//         .map((snapshot) => right<NoteFailure, KtList<NoteEntity>>(
//               /// [snapshot.docs] has List of QueryDocumentSnapshot
//               snapshot.docs

//                   /// and we want to map [QueryDocumentSnapshot] in to [KtList] of NoteEntity
//                   .map((doc) => NoteDTO.fromFirestore(doc)

//                       /// [NoteDTO] map to domain
//                       .toDomain())
//                   .toImmutableList(),
//             ))
//         .onErrorReturnWith((e, st) {
//       if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
//         return const Left(NoteFailure.insufficientPermissions());
//       } else {
//         log(e.toString());
//         return const Left(NoteFailure.insufficientPermissions());
//       }
//     });
//   }

//   @override
//   Stream<Either<NoteFailure, KtList<NoteEntity>>> watchUncompleted() async* {
//     final userDoc = await _firebaseFirestore.userDocument();

//     yield* userDoc
//         .collection("notes")
//         .orderBy("serverTimeStamp", descending: true)
//         .snapshots()

//         /// first [map] functionmap th documentSnapshot to note Entities
//         .map(
//           (snapshot) =>
//               snapshot.docs.map((doc) => NoteDTO.fromFirestore(doc).toDomain()),
//         )

//         /// then they are pass in to the seconond [map] function as at
//         /// [[Iterable<NoteEntity> notes]].
//         ///
//         /// And here we only return [right] side because,[map] not recive
//         /// incorrect values.
//         ///
//         /// And we need to filter [uncompleted] todos
//         .map(
//           /// [Iterable<NoteEntity> notes]
//           (notes) => right<NoteFailure, KtList<NoteEntity>>(
//             notes
//                 .where(
//                   (note) => note.todos.getOrCrash().any(
//                         (todoItem) => !todoItem.done,
//                       ),
//                 )

//                 /// why [toImmutableList]
//                 /// becase [KtList] is [Mutable List]
//                 /// We need to convert it  [toImmutableList]
//                 .toImmutableList(),
//           ),
//         )
//         .onErrorReturnWith((e, st) {
//       if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
//         return const Left(NoteFailure.insufficientPermissions());
//       } else {
//         log(e.toString());
//         return const Left(NoteFailure.insufficientPermissions());
//       }
//     });
//   }

//   @override
//   Future<Either<NoteFailure, Unit>> create(NoteEntity note) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<NoteFailure, Unit>> delete(NoteEntity note) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<NoteFailure, Unit>> update(NoteEntity note) {
//     throw UnimplementedError();
//   }
// }

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ddd_concepts/infrastructure/note/dto/note_dtos.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_ddd_concepts/domain/note/entities/note_entity.dart';
import 'package:flutter_ddd_concepts/domain/note/failure/note_failure.dart';
import 'package:flutter_ddd_concepts/domain/note/repository/i_note_repository.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
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

    yield* userDoc
        .collection("notes")
        .orderBy("serverTimeStamp", descending: true)
        .snapshots()
        .map((snapshot) => right<NoteFailure, KtList<NoteEntity>>(
              snapshot.docs
                  .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
                  .toImmutableList(),
            ))
        .onErrorReturnWith((e, st) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return const Left(NoteFailure.insufficientPermissions());
      } else {
        log(e.toString());
        return const Left(NoteFailure.insufficientPermissions());
      }
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<NoteEntity>>> watchUncompleted() async* {
    final userDoc = await _firebaseFirestore.userDocument();

    yield* userDoc
        .collection("notes")
        .orderBy("serverTimeStamp", descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => NoteDTO.fromFirestore(doc).toDomain()),
        )
        .map(
          (notes) => right<NoteFailure, KtList<NoteEntity>>(
            notes
                .where((note) => note.todos.getOrCrash().any(
                      (todoItem) => !todoItem.done,
                    ))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((e, st) {
      if (e is PlatformException && e.message!.contains('PERMISSION_DENIED')) {
        return const Left(NoteFailure.insufficientPermissions());
      } else {
        log(e.toString());
        return const Left(NoteFailure.insufficientPermissions());
      }
    });
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
