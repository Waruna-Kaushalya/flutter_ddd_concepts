import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/domain/core/errors.dart';

import '../auth/value_objects/failures/failures.dart';

@immutable
abstract class ValueObject<T> {
  /// Either is use for return validated value respose.
  /// that means [validateEmailAddress] function return
  /// [Either] type response. if value is validated without
  /// any issue then retun it self [value] in [right] side
  /// and if it has any issue then retun in it right side.
  ///
  /// [final Either<ValueFailure<String>, String> value]
  /// why this line use Either type.
  ///  becase Validated value object
  /// response must going Further.
  const ValueObject();

  /// ptivate constructor
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  /// check email or pasword valid or not
  /// if valid [value] has data in [right] side
  /// then [isValid()] return true
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}