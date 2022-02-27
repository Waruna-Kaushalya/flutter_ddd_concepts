import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/auth/facade/failures/auth_failure.dart';
import '../../../../domain/auth/facade/i_auth_facade.dart';
import '../../../../domain/auth/value_objects/objects/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial()) {
    //! asysnc is not written
    on<SignInFormEvent>((event, emit) async {
      await event.map(
        /// Validate newly update email address
        /// when user enter email and re enter email
        emailChanged: (value) {
          emit(state.copyWith(
            emailAddress: EmailAddress(value.emailStr.trim()),

            /// registerd successfully --> some(right(unit))
            /// unsscsefull --> none(left(AuthFailure))
            authFailureOrSuccessOption: none(),
          ));
        },

        /// Validate newly update password
        passwordChanged: (value) {
          emit(state.copyWith(
            password: Password(value.passwordStr.trim()),
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

          //! in here emit is not availeble in video
          //! emit add due to ocre emit is not in bloc call back isse
          //! The member 'emit' can only be used within 'package:bloc/src/bloc.dart' or a test. there for add [Emitter<SignInFormState> emit] argument
          // _performAction0nAuthFacadeWithEmaiLAndPassword(
          //   _authFacade.registerWithEmailAndPassword,
          //   emit,
          // );
          await signInEmailP(_authFacade.registerWithEmailAndPassword, emit);
        },
        signInWithEmailAndPasswordPressed: (value) async {
          // /// sign in the user using [IAuthFacade]

          // //! in here emit is not availeble in video
          // //! emit add due to ocre emit is not in bloc call back isse
          // //! The member 'emit' can only be used within 'package:bloc/src/bloc.dart' or a test. there for add [Emitter<SignInFormState> emit] argument
          // _performAction0nAuthFacadeWithEmaiLAndPassword(
          //   _authFacade.signInWithEmailAndPassword,
          //   emit,
          // );
          //! ===============================
          await signInEmailP(_authFacade.signInWithEmailAndPassword, emit);
          //! ===============================
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

  Future<void> signInEmailP(
      Future<Either<AuthFailure, Unit>> Function({
    required EmailAddress emailAddress,
    required Password password,
  })
          forwardedCall,
      Emitter<SignInFormState> emit) async {
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
    }
    emit(state.copyWith(
      /// stop loading indicator
      isSubmitting: false,
      //! concern about whay [showErrorMessages] value has true.
      //! becase if auth is success no need to show err msg
      showErrorMessages: true,

      /// why [optionOf]
      /// [optionOf] is equl to
      /// [failureOrSuccess == null ? none() : some(failureOrSuccess)]
      /// [authFailureOrSuccessOption] both option are correct
      ///
      // authFailureOrSuccessOption:
      //     failureOrSuccess == null ? none() : some(failureOrSuccess),
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}

//   Stream<SignInFormEvent> _performAction0nAuthFacadeWithEmaiLAndPassword(
//     Future<Either<AuthFailure, Unit>> Function({
//       required EmailAddress emailAddress,
//       required Password password,
//     })
//         forwardedCall,
//     Emitter<SignInFormState> emit,
//   ) async* {
//     Either<AuthFailure, Unit>? failureOrSuccess;
//     final isEmailValid = state.emailAddress.isValid();
//     final isPasswordValid = state.password.isValid();
//     // check email is valid or not
//     if (isEmailValid && isPasswordValid) {
//       //! The member 'emit' can only be used within 'package:bloc/src/bloc.dart' or a test. there for add [Emitter<SignInFormState> emit] argument
//       emit(state.copyWith(
//         /// loading indicator --> true
//         isSubmitting: true,

//         /// resetiiing previos login
//         authFailureOrSuccessOption: none(),
//       ));

//       /// register the user using [IAuthFacade]
//       failureOrSuccess = await forwardedCall(
//         emailAddress: state.emailAddress,
//         password: state.password,
//       );
//     }
//     emit(state.copyWith(
//       /// stop loading indicator
//       isSubmitting: false,
//       //! concern about whay [showErrorMessages] value has true.
//       //! becase if auth is success no need to show err msg
//       showErrorMessages: true,

//       /// why [optionOf]
//       /// [optionOf] is equl to
//       /// [failureOrSuccess == null ? none() : some(failureOrSuccess)]
//       /// [authFailureOrSuccessOption] both option are correct
//       ///
//       // authFailureOrSuccessOption:
//       //     failureOrSuccess == null ? none() : some(failureOrSuccess),
//       authFailureOrSuccessOption: optionOf(failureOrSuccess),
//     ));
//   }
// }
