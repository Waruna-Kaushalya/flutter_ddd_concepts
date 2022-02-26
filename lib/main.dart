import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Environment.prod);
  runApp(const MyApp());
}
