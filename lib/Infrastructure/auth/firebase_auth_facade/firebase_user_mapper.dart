import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_ddd_concepts/domain/auth/entities/user.dart';

import '../../../domain/auth/value_objects/objects/value_objects.dart';

extension FirebaseUserDomainX on auth.User {
  CurrentUser toDomain() {
    return CurrentUser(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
