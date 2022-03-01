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
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory ValueFailure.multiLine({required T failedValue}) = MultiLine<T>;
  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
}

// @freezed
// class ValueFailure<T> with _$ValueFailure<T> {
//   const factory ValueFailure.auth(AuthValueFailure<T> f) = Auth<T>;
//   const factory ValueFailure.note(NoteValueFailure<T> f) = Note<T>;
// }

// @freezed
// class AuthValueFailure<T> with _$AuthValueFailure<T> {
//   const factory AuthValueFailure.invalidEmail({required T failedValue}) =
//       InvalidEmail<T>;
//   const factory AuthValueFailure.shortPassword({required T failedValue}) =
//       ShortPassword<T>;
// }

// @freezed
// class NoteValueFailure<T> with _$NoteValueFailure<T> {
//   const factory NoteValueFailure.exceedingLength({
//     required T failedValue,
//     required int max,
//   }) = ExceedingLength<T>;
//   const factory NoteValueFailure.empty({required T failedValue}) = Empty<T>;
//   const factory NoteValueFailure.multiLine({required T failedValue}) =
//       MultiLine<T>;
//   const factory NoteValueFailure.listTooLong({
//     required T failedValue,
//     required int max,
//   }) = ListTooLong<T>;
// }


