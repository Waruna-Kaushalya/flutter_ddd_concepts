import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/application/auth/auth.dart';
import 'package:flutter_ddd_concepts/presentation/routes/app_router.dart';
import 'package:flutter_ddd_concepts/presentation/sign_in/sign_in_page.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splashPage';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            print("I'm authenticated");
            context.goNamed(SignInPage.routeName);
          },
          unAuthenticated: (_) => context.goNamed(SignInPage.routeName),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
