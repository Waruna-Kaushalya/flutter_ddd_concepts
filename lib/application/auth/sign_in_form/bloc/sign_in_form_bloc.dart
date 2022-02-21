import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/auth/facade/failures/auth_failure.dart';
import '../../../../domain/auth/facade/i_auth_facade.dart';
import '../../../../domain/auth/value_objects/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial()) {
    //! asysnc is not written
    on<SignInFormEvent>((event, emit) {
      event.map(
        /// Validate newly update email address
        emailChanged: (value) {
          emit(state.copyWith(
            emailAddress: EmailAddress(value.emailStr),

            /// registerd successfully --> some(right(unit))
            /// unsscsefull --> none(left(AuthFailure))
            authFailureOrSuccessOption: none(),
          ));
        },

        /// Validate newly update password
        passwordChanged: (value) {
          emit(state.copyWith(
            password: Password(value.passwordStr),
            authFailureOrSuccessOption: none(),
          ));
        },

        /// checkif the entered email and password are valid.
        ///
        /// if valid,register using [IAuthFacade] and
        /// emit Some<Right<Unit> in the [authFailureOrSuccessOption]
        /// state field
        ///
        /// If invalid, indicate to start showing
        /// error messages and keep the
        /// [authFailureOrSuccessOption] set to None.
        registerWithEmailAndPasswordPressed: (value) {
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();
          // check email is valid or not
          if (isEmailValid && isPasswordValid) {}
        },
        signInWithEmailAndPasswordPressed: (value) {},
        signInWithGooglePressed: (value) async {
          emit(state.copyWith(
            /// loading indicator --> true
            isSubmitting: true,

            /// resetiiing previos login
            authFailureOrSuccessOption: none(),
          ));

          final failureOrSuccess = await _authFacade.signInWithGoogle();

          emit(state.copyWith(
            /// stop loading indicator
            isSubmitting: false,

            /// auth Failure Or Success --> some()
            authFailureOrSuccessOption: some(failureOrSuccess),
          ));
        },
      );
    });
  }
}
