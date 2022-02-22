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
        registerWithEmailAndPasswordPressed: (value) async {
          /// register the user using [IAuthFacade]
          // failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
          //   emailAddress: state.emailAddress,
          //   password: state.password,
          // );

          //! in here emit is not availeble in video
          //! emit add due to ocre emit is not in bloc call back isse
          //! The member 'emit' can only be used within 'package:bloc/src/bloc.dart' or a test. there for add [Emitter<SignInFormState> emit] argument
          _performAction0nAuthFacadeWithEmaiLAndPassword(
            _authFacade.registerWithEmailAndPassword,
            emit,
          );
        },
        signInWithEmailAndPasswordPressed: (value) {
          /// sign in the user using [IAuthFacade]
          // failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
          //   emailAddress: state.emailAddress,
          //   password: state.password,
          // );

          //! in here emit is not availeble in video
          //! emit add due to ocre emit is not in bloc call back isse
          //! The member 'emit' can only be used within 'package:bloc/src/bloc.dart' or a test. there for add [Emitter<SignInFormState> emit] argument
          _performAction0nAuthFacadeWithEmaiLAndPassword(
            _authFacade.signInWithEmailAndPassword,
            emit,
          );
        },
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

  Stream<SignInFormEvent> _performAction0nAuthFacadeWithEmaiLAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
    Emitter<SignInFormState> emit,
  ) async* {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    // check email is valid or not
    if (isEmailValid && isPasswordValid) {
      //! The member 'emit' can only be used within 'package:bloc/src/bloc.dart' or a test. there for add [Emitter<SignInFormState> emit] argument
      emit(state.copyWith(
        /// loading indicator --> true
        isSubmitting: true,

        /// resetiiing previos login
        authFailureOrSuccessOption: none(),
      ));

      /// register the user using [IAuthFacade]
      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );

      // emit(state.copyWith(
      //   /// auth Failure Or Success --> some()
      //   authFailureOrSuccessOption: some(failureOrSuccess),
      // ));
    }
    emit(state.copyWith(
      /// stop loading indicator
      isSubmitting: false,
      showErrorMessages: true,

      /// [authFailureOrSuccessOption] both option are correct
      ///
      // authFailureOrSuccessOption:
      //     failureOrSuccess == null ? none() : some(failureOrSuccess),
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
