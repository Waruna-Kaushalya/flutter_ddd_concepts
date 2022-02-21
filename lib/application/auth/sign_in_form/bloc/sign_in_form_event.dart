part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}

// part of 'sign_in_form_bloc.dart';

// enum SignInFormEventStatus {
//   emailChanged,
//   passwordChanged,
//   registerWithEmailAndPasswordPressed,
//   signInWithEmailAndPasswordPressed,
//   signInWithGooglePressed,
// }

// extension SignInFormEventX on SignInFormEventStatus {
//   bool get isEmailChanged => this == SignInFormEventStatus.emailChanged;
//   bool get isPasswordChanged => this == SignInFormEventStatus.passwordChanged;
//   bool get isRegisterWithEmailAndPasswordPressed =>
//       this == SignInFormEventStatus.registerWithEmailAndPasswordPressed;
//   bool get isSignInWithEmailAndPasswordPressed =>
//       this == SignInFormEventStatus.signInWithEmailAndPasswordPressed;
//   bool get isSignInWithGooglePressed =>
//       this == SignInFormEventStatus.signInWithGooglePressed;
// }

// @freezed
// class SignInFormEvent with _$SignInFormEvent {
//   factory SignInFormEvent({
//     required String emailStr,
//     required String passwordStr,
//   }) = _SignInFormEvent;
// }
