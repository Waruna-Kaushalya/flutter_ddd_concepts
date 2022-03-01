import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

/// this is failire types
/// freezed union.
/// what is the reson for use unnion.
/// becase we dont need to remmmber
/// failler types or exception types.
/// union make it for us when using [map] or [when]

@freezed
abstract class NoteValueFailure<T> with _$NoteValueFailure<T> {
  const factory NoteValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory NoteValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory NoteValueFailure.multiLine({required T failedValue}) =
      MultiLine<T>;
  const factory NoteValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
}
