import 'package:uuid/uuid.dart';
import 'package:dartz/dartz.dart';

import '../core/value_object.dart';
import '../core/value_failures.dart';

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  /// this constructer create unique id within inside a app
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  /// this constructer not create unique id within or inside a app
  /// insted of use 3rd paty unique id providrs Unique id
  /// ex: firebase auth
  factory UniqueId.fromUniqueString({required String id}) {
    return UniqueId._(
      right(id),
    );
  }
  const UniqueId._(this.value);
}
