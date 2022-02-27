import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_concepts/domain/auth/entities/user.dart';

import '../value_objects/objects/value_objects.dart';
import 'failures/auth_failure.dart';

//this is like reposotory
//abstraction for register and sign in with email and google sign in
// contract

abstract class IAuthFacade {
  Future<Option<CurrentUser>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
