import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages,
          child: ListView(
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
                onChanged: (value) => context.read<SignInFormBloc>().add(
                      SignInFormEvent.passwordChanged(value),
                    ),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                              shortPassword: (_) => "Short Password",
                              orElse: () => null,
                            ),
                        (r) => null),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "SIGN IN WITH GOOGLE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
