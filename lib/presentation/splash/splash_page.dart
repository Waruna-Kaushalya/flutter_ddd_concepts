import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/presentation/notes/notes_overview/notes_overview_page.dart';
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
          authenticated: (_) => context.goNamed(NotesOverviewPage.routeName),
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
