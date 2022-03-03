import 'package:dartz/dartz.dart';
import '../../core/value_failures.dart';
import '../../core/value_object.dart';
import '../../core/value_object_validators.dart';

class TodoNameObj extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoNameObj(String input) {
    return TodoNameObj._(
      /// [flatMap] if previos part ok, then go with after part
      /// that means if [validateMaxStringLenght] return [right] side
      /// with sussess then excute [validateStringNotEmpty] and then [validateSingleline]
      /// if [validateMaxStringLenght] return validation failure with left side
      /// then [validateStringNotEmpty] not excute
      ///
      /// if first validated value invalid, so it's [left] then whole chain
      /// is shortcircited
      validateMaxStringLenght(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleline),
    );
  }
  const TodoNameObj._(this.value);
}
