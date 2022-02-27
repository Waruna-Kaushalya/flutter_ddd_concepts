import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../core/value_objects.dart';
import 'failures/failures.dart';

import 'value_object_validators/value_validators.dart';

/// EmailAddress data class
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

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  /// this constructer create unique id within inside a app
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  /// this constructer not create unique id within or inside a app
  /// insted of use 3rd paty unique id providrs Unique id
  /// ex: firebase auth
  factory UniqueId.fromUniqueString(String uniqueid) {
    return UniqueId._(right(uniqueid));
  }
  const UniqueId._(this.value);
}
