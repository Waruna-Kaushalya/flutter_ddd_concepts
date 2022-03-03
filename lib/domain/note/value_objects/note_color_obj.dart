import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/domain/core/value_transformers.dart';

import '../../core/value_failures.dart';
import '../../core/value_object.dart';

class NoteColorObj extends ValueObject<Color> {
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
  factory NoteColorObj(Color input) {
    return NoteColorObj._(
      right(
        makeColorOpaque(input),
      ),
    );
  }
  const NoteColorObj._(this.value);
}
