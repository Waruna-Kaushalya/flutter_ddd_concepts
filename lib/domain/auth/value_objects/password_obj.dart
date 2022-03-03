import 'package:dartz/dartz.dart';

import '../../core/value_object.dart';
import '../../core/value_failures.dart';
import '../../core/value_object_validators.dart';

/// Password data class
class PasswordObj extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PasswordObj._(this.value);

  factory PasswordObj(String input) {
    // assert(input != null);
    return PasswordObj._(
      validatePassword(input),
    );
  }
}
