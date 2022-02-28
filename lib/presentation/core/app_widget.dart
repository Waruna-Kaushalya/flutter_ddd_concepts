import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/application/auth/auth.dart';

import '../../injection.dart';
import '../routes/app_router.dart';

class MyApp extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  // auto_route - one lines
  final _appRouter = AppRouter();

  // final AppRoutes appRoutes;
  MyApp({
    Key? key,
    // required this.appRoutes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp.router(
        // auto_route - two lines
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),

        title: 'Note',
        // home: const SignInPage(),

        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.green[800],
                secondary: Colors.blueAccent,
              ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          ),
        ),
        // manual onGenerateRoute
        // initialRoute: SignInPage.routeName,
        // onGenerateRoute: appRoutes.onGenerateRoute,
      ),
    );
  }
}
