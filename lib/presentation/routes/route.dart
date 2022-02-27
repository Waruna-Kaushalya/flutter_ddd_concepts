import 'package:flutter/material.dart';
import 'package:flutter_ddd_concepts/presentation/sign_in/sign_in_page.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      ///
      /// [home] pages

      case SignInPage.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: 'MyHomePage'),
          builder: (context) => const SignInPage(),
        );

      // case FeatureShowcase.routeName:
      //   return MaterialPageRoute(
      //     settings: const RouteSettings(name: 'FeatureShowcase'),
      //     builder: (context) => const FeatureShowcase(),
      //   );

      default:
        return null;
    }
  }
}
