import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

/// this is failire types
/// freezed union.
/// what is the reson for use unnion.
/// becase we dont need to remmmber
/// failler types or exception types.
/// union make it for us when using [map] or [when]

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({required T failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.shortPassword({required T failedValue}) =
      ShortPassword<T>;
}
