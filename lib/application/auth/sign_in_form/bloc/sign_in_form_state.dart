part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,

    /// why [Option]
    ///
    /// Bacause in initially there is no response untill user press button.
    ///
    /// [Either<AuthFailure, Unit>] in here Right side means sucssesfull
    /// sign in and Left side means unsucssful sign in.
    ///
    /// we also need to have way to just no sign in happend yet.
    ///
    /// [Option<None,Some>]
    /// none means no value s present, some means some value is present
    ///
    /// Then we can ui to in initlly Option<None>. That means sign in not
    /// happend yet
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
