import 'package:go_router/go_router.dart';

import '../auth/sign_in/sign_in_page.dart';
import '../splash/pages.dart';

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
    ],
  );
}
