import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../value_objects/value_objects.dart';
import '../failures/auth_failure.dart';

//this is like reposotory
//abstraction for register and sign in with email and google sign in
// contract

abstract class IAuthFacade {
  /// [Option] is nonnullable type
  /// Either hold [none] or [some]
  /// if passed is null value then => [none]
  /// if passed some value then => [some]
  Future<Option<UserEntity>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddressObj emailAddress,
    required PasswordObj password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddressObj emailAddress,
    required PasswordObj password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
