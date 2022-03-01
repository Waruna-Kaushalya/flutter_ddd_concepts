import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import './value_failures.dart';

/// this is value object validators
/// this functions input [Strings] and
/// return [Either] type
/// [right] side is validated without any issue
/// [left] side is retun when object has any issue

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
    // return Left(
    //   ValueFailure.auth(
    //     AuthValueFailure.invalidEmail(failedValue: input),
    //   ),
    // );
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
    // return Left(
    //   ValueFailure.auth(
    //     AuthValueFailure.shortPassword(failedValue: input),
    //   ),
    // );
  }
}

Either<ValueFailure<String>, String> validateMaxStringLenght(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return Right(input);
  } else {
    return Left(
        ValueFailure.exceedingLength(failedValue: input, max: maxLength));
    // return Left(
    //   ValueFailure.note(
    //     NoteValueFailure.exceedingLength(failedValue: input, max: maxLength),
    //   ),
    // );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return Right(input);
  } else {
    return Left(ValueFailure.empty(failedValue: input));
    // return Left(
    //   ValueFailure.note(
    //     NoteValueFailure.empty(failedValue: input),
    //   ),
    // );
  }
}

Either<ValueFailure<String>, String> validateSingleline(String input) {
  if (!input.contains("\n")) {
    return Right(input);
  } else {
    return Left(ValueFailure.multiLine(failedValue: input));
    // return Left(
    //   ValueFailure.note(
    //     NoteValueFailure.multiLine(failedValue: input),
    //   ),
    // );
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLenght<T>(
  KtList<T> input,
  int maxLenght,
) {
  if (input.size <= maxLenght) {
    return Right(input);
  } else {
    return Left(ValueFailure.listTooLong(failedValue: input, max: maxLenght));
    // return Left(
    //   ValueFailure.note(
    //     NoteValueFailure.listTooLong(failedValue: input, max: maxLenght),
    //   ),
    // );
  }
}
