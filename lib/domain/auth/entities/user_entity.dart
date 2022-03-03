import 'package:freezed_annotation/freezed_annotation.dart';

import '../../value_objects/unique_id.dart';

part 'user_entity.freezed.dart';

// independent User
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required UniqueIdObj currentUserId,
  }) = _UserEntity;
}
