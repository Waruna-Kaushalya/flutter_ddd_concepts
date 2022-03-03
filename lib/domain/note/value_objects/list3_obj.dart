import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import '../../core/value_failures.dart';
import '../../core/value_object.dart';
import '../../core/value_object_validators.dart';

class List3Obj<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3Obj(KtList<T> input) {
    return List3Obj._(validateMaxListLenght(input, maxLength));
  }
  const List3Obj._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
