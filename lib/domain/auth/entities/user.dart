import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/objects/unique_id.dart';

part 'user.freezed.dart';

// independent User
@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required UniqueId currentUserId,
  }) = _CurrentUser;
}
