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
        registerWithEmailAndPasswordPressed: (value) {},
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
