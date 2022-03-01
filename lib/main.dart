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

  // Firebase call
  await Firebase.initializeApp();
  configureDependencies(Environment.prod);

  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: observer,
  );
}
