import 'package:dartz/dartz.dart';
import '../failures/value_failures.dart';

/// this is value object validators
/// this functions input [Strings] and
/// return [Either] type
/// [right] side is validated without any issue
/// [left] side is retun when object has any issue

Either<NoteValueFailure<String>, String> validateMaxStringLenght(
  String input,
  int maxLenght,
) {
  if (input.length <= maxLenght) {
    return Right(input);
  } else {
    return Left(
        NoteValueFailure.exceedingLength(failedValue: input, max: maxLenght));
  }
}

Either<NoteValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return Right(input);
  } else {
    return Left(NoteValueFailure.empty(failedValue: input));
  }
}
