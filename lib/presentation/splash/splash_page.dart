import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:flutter_ddd_concepts/routes/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../application/aplication.dart';
import '../auth/sign_in/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splashPage';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              context.router.replace(const NotesOverviewRoute()),
          unAuthenticated: (_) => context.router.replace(const SignInRoute()),
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
