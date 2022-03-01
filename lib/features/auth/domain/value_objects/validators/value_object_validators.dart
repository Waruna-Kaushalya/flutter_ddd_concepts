import 'package:dartz/dartz.dart';
import '../failures/value_failures.dart';

/// this is value object validators
/// this functions input [Strings] and
/// return [Either] type
/// [right] side is validated without any issue
/// [left] side is retun when object has any issue

Either<AuthValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(AuthValueFailure.invalidEmail(failedValue: input));
  }
}

Either<AuthValueFailure<String>, String> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(AuthValueFailure.shortPassword(failedValue: input));
  }
}
