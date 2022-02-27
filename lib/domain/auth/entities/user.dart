import 'package:flutter_ddd_concepts/domain/auth/value_objects/objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

// independent User
@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required UniqueId currentUserId,
  }) = _CurrentUser;
}
