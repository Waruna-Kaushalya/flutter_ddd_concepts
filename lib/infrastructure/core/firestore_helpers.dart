import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ddd_concepts/domain/auth/facade/i_auth_facade.dart';
import 'package:flutter_ddd_concepts/domain/core/core.dart';

import '../../injection.dart';

/// extension method gives us readily available user documents
extension FirebaseFirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUserId.getOrCrash());
  }
}

/// extension for getting the notes collection
extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteColletion => collection('notes');
}
