import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../routes/app_router.dart';
import '../injection.dart';
import '../application/auth/auth_bloc/auth_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /// go_route
  // final _router = Routes().router;

  /// auto_route
  final _appRouter = AppRouter();

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
        /// go_route
        // routerDelegate: _router.routerDelegate,
        // routeInformationParser: _router.routeInformationParser,

        /// auto_route
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
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue[900])),
      ),
    );
  }
}
