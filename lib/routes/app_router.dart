import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/presentation/splash/splash_page.dart';

import '../presentation/auth/sign_in/sign_in_page.dart';
import '../presentation/notes/notes_overview/notes_overview_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: NotesOverviewPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
