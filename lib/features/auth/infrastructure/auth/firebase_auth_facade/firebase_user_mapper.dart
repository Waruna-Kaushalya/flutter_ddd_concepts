import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/domain.dart';

extension FirebaseUserDomainX on auth.User {
  CurrentUser toDomain() {
    return CurrentUser(
      currentUserId: UniqueId.fromUniqueString(uniqueid: uid),
    );
  }
}
