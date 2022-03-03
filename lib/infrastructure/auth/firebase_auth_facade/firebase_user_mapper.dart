import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/domain.dart';

extension FirebaseUserDomainX on auth.User {
  UserEntity toDomain() {
    return UserEntity(
      currentUserId: UniqueIdObj.fromUniqueString(id: uid),
    );
  }
}
