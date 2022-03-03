import 'package:dartz/dartz.dart';

import '../../core/value_failures.dart';
import '../../core/value_object.dart';
import '../../core/value_object_validators.dart';

class NoteBodyObj extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  const NoteBodyObj._(this.value);

  factory NoteBodyObj(String input) {
    return NoteBodyObj._(
      /// [flatMap]
      /// if Either is right, continue [flatmap]
      /// if Either is left, not continue
      validateMaxStringLenght(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }
}
