import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/core/app.dart';
import 'package:injectable/injectable.dart';

import 'features/auth/application/aplication.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final observer = AppBlocObserver();

  await Firebase.initializeApp(); // new Firebase call
  configureDependencies(Environment.prod);
  // runApp(const MyApp());

  /// BlocObserver can be used to observe all
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: observer,
  );
}
