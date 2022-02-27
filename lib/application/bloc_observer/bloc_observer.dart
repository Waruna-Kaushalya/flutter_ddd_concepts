import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

//An interface for observing the behavior of Bloc instances.
class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    developer.log(
      '------transition------$transition',
      name: 'onTransition',
    );
    developer.log(
      '------bloc------$bloc',
      name: 'onTransition',
    );

    super.onTransition(bloc, transition);
  }

  //? either

  @override
  void onChange(BlocBase bloc, Change change) {
    developer.log(
      '------bloc------$bloc',
      name: 'onChange',
    );
    developer.log(
      '------change------$change',
      name: 'onChange',
    );

    super.onChange(bloc, change);
  }

  //? with

  @override
  void onEvent(Bloc bloc, Object? event) {
    developer.log(
      '------bloc------$bloc',
      name: 'onEvent',
    );
    developer.log(
      '------event------$event',
      name: 'onEvent',
    );

    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase bloc) {
    developer.log(
      '------bloc------$bloc',
      name: 'onClose',
    );

    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    developer.log(
      '--------bloc----------$bloc',
      name: 'onCreate',
    );
    // print("onCreate------------------" + "$bloc");
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log(
      '------bloc------$bloc',
      name: 'onError',
    );
    developer.log(
      '------error------$error',
      name: 'onError',
    );
    developer.log(
      '------stackTrace------$stackTrace',
      name: 'onError',
    );

    super.onError(bloc, error, stackTrace);
  }
}
