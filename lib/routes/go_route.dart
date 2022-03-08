import 'package:flutter_ddd_concepts/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

class Routes {
  final router = GoRouter(
    initialLocation: SplashPage.routeName,
    routes: [
      GoRoute(
        path: SignInPage.routeName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: SplashPage.routeName,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: NotesOverviewPage.routeName,
        builder: (context, state) => const NotesOverviewPage(),
      ),
    ],
  );
}
