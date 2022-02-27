import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/application/auth/auth.dart';

import 'package:flutter_ddd_concepts/presentation/sign_in/sign_in_page.dart';

import '../../injection.dart';
import '../routes/route.dart';

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({
    Key? key,
    required this.appRoutes,
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
      child: MaterialApp(
        title: 'Note',
        home: const SignInPage(),
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
          // buttonTheme: ButtonThemeData(
          //   textTheme: ButtonTextTheme.accent,
          // ),
        ),
        initialRoute: SignInPage.routeName,
        onGenerateRoute: appRoutes.onGenerateRoute,
      ),
    );
  }
}
