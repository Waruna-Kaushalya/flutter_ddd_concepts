import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../../../core/value_objects.dart';
import '../failures/failures.dart';

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
  factory UniqueId.fromUniqueString(String uniqueid) {
    return UniqueId._(right(uniqueid));
  }
  const UniqueId._(this.value);
}
