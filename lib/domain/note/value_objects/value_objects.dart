import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/domain/core/value_transformers.dart';
import 'package:kt_dart/collection.dart';

import '../../core/value_failures.dart';
import '../../core/value_object.dart';
import '../../core/value_object_validators.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  const NoteBody._(this.value);

  factory NoteBody(String input) {
    return NoteBody._(
      /// [flatMap]
      /// if Either is right, continue [flatmap]
      /// if Either is left, not continue
      validateMaxStringLenght(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    return TodoName._(
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
  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;
  factory NoteColor(Color input) {
    return NoteColor._(
      right(
        makeColorOpaque(input),
      ),
    );
  }
  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    return List3._(validateMaxListLenght(input, maxLength));
  }
  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
