import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  /// Either is use for return validated value respose.
  /// that means [validateEmailAddress] function return
  /// [Either] type response. if value is validated without
  /// any issue then retun [value] it self  in [right] side
  /// and if it has any issue then retun in it right side.
  ///
  /// [final Either<ValueFailure<String>, String> value]
  /// why this line use Either type.
  /// becase Validated value object
  /// response must going Further.
  @override
  final Either<ValueFailure<String>, String> value;

  /// ptivate constructor
  const EmailAddress._(this.value);

  factory EmailAddress(String input) {
    // assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
}

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
