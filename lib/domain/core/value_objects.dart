import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'failures.dart';

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
