import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/presentation/sign_in/sign_in_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        ));
  }
}
