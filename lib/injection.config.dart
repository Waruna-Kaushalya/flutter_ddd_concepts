// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc/auth_bloc.dart' as _i3;
import 'application/auth/sign_in_form_bloc/sign_in_form_bloc.dart' as _i8;
import 'domain/auth/facade/facade.dart' as _i6;
import 'infrastructure/core/firebase_injectable_module.dart' as _i9;
import 'infrastructure/firebase_auth_facade/firebase_auth_facade.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc(get<dynamic>()));
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i6.IAuthFacade>(() =>
      _i7.FirebaseAuthFacade(get<_i4.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.factory<_i8.SignInFormBloc>(() => _i8.SignInFormBloc(get<dynamic>()));
  return get;
}

class _$FirebaseInjectableModule extends _i9.FirebaseInjectableModule {}
