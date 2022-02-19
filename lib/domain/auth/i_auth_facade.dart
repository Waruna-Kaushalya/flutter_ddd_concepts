import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/auth/value_objects.dart';

import 'auth_failure.dart';

//this is like reposotory
//abstraction for register and sign in with email and google sign in

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
