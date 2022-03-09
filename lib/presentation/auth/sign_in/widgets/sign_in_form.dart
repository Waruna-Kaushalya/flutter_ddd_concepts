import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/routes/app_router.dart';

import '../../../../application/aplication.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        /// Option<Either<AuthFailure, Unit>> get [authFailureOrSuccessOption]
        /// B fold<B>(B ifNone(), B ifSome(A a));
        state.authFailureOrSuccessOption.fold(
          // ifNone
          () {},
          // ifSome
          (either) => either.fold((authFailure) {
            /// [Snakbar]
            FlushbarHelper.createError(
              message: authFailure.map(
                cancelledByUser: (_) => "Canceled",
                serverError: (_) => "Server Error",
                emailAlreadyInUse: (_) => "Email Already In Use",
                invalidEmailAndPasswordCombination: (_) =>
                    "Invalid Email And Password Combination",
              ),
            ).show(context);
          }, (_) {
            context.router.replace(const NotesOverviewRoute());

            context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
          }),
        );
      },
      builder: (context, state) {
        return Form(
          // validate or not
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                "📝",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                ),
                autocorrect: false,
                onChanged: (value) => context.read<SignInFormBloc>().add(
                      SignInFormEvent.emailChanged(value),
                    ),
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                        (f) => f.maybeMap(
                              invalidEmail: (_) => "Invalid Email",
                              orElse: () => null,
                            ),
                        (r) => null),
                // validator: (_) => context
                //     .read<SignInFormBloc>()
                //     .state
                //     .emailAddress
                //     .value
                //     .fold(
                //       (failure) => failure.maybeMap(
                //         auth: (value) => value.f.maybeMap(
                //           invalidEmail: (_) => "Invalid Email",
                //           orElse: () => null,
                //         ),
                //         orElse: () => null,
                //       ),
                //       (r) => null,
                //     ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => context.read<SignInFormBloc>().add(
                      SignInFormEvent.passwordChanged(value),
                    ),

                /// B fold<B>(B Function(ValueFailure<String>) ifLeft, B Function(String) ifRight)
                validator: (_) =>
                    context.read<SignInFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                              shortPassword: (_) => "Short Password",
                              orElse: () => null,
                            ),
                        (r) => null),
                // validator: (_) => context
                //     .read<SignInFormBloc>()
                //     .state
                //     .emailAddress
                //     .value
                //     .fold(
                //       (failure) => failure.maybeMap(
                //         auth: (value) => value.f.maybeMap(
                //           shortPassword: (_) => "Invalid Email",
                //           orElse: () => null,
                //         ),
                //         orElse: () => null,
                //       ),
                //       (r) => null,
                //     ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: elevatedbuttonStyle(
                          fontColor: Colors.white, buttonColor: Colors.teal),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  //fddfb
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: elevatedbuttonStyle(
                          fontColor: Colors.white, buttonColor: Colors.teal),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SignInFormBloc>().add(
                        const SignInFormEvent.signInWithGooglePressed(),
                      );
                },
                child: const Text(
                  "SIGN IN WITH GOOGLE",
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 16,
                  ),
                ),
                style: elevatedbuttonStyle(
                    fontColor: Colors.white, buttonColor: Colors.blue),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(
                  height: 8,
                ),
                const LinearProgressIndicator(
                  value: null,
                )
              ],
            ],
          ),
        );
      },
    );
  }

  ButtonStyle elevatedbuttonStyle(
      {required Color fontColor, required Color buttonColor}) {
    return ElevatedButton.styleFrom(
      /// Button height and width
      // minimumSize: const Size(
      //   300,
      //   50,
      // ),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      primary: buttonColor,

      /// Backgroud
      onPrimary: fontColor,

      /// Font color
      /// Button circular boder radiaus a
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(30),
      // ),
    );
  }
}
