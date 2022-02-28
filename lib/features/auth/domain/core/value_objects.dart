import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../value_objects/failures/value_failures.dart';
import 'errors.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  /// ptivate constructor
  const ValueObject();

  /// Either is use for return validated value respose.
  /// that means [validateEmailAddress] function return
  /// [Either] type response. if value is validated without
  /// any issue then retun it self [value] in [right] side
  /// and if it has any issue then retun in it left side.
  ///
  /// [final Either<ValueFailure<String>, String> value]
  /// why this line use Either type.
  ///  becase Validated value object
  /// response must going Further.
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
  List<Object?> get props => [value];

  @override
  String toString() => 'Value($value)';
}
