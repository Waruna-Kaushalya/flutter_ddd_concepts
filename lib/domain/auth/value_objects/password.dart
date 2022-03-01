import 'package:dartz/dartz.dart';

import '../../core/value_object.dart';
import '../../core/value_failures.dart';
import '../../core/value_object_validators.dart';

/// Password data class
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  factory Password(String input) {
    // assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }
}
