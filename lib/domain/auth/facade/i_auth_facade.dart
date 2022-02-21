import 'package:dartz/dartz.dart';

import '../value_objects/value_objects.dart';
import 'failures/auth_failure.dart';

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
