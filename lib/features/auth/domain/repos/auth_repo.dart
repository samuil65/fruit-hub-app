import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  // Function AuthRepo create User With Email And Password
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  // Function AuthRepo logIn With Email And Password
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // Function AuthRepo logIn With Google
  Future<Either<Failure, UserEntity>> logInWithGoogle();

  // Function AuthRepo logIn With Facebook
  Future<Either<Failure, UserEntity>> logInWithFacebook();

  // Function AuthRepo logIn With Apple
  Future<Either<Failure, UserEntity>> logInWithApple();

  // *------------------Firestore Functions------------------*
  // Function AuthRepo add User Data to Firestore
  Future addUserData({required UserEntity user});
  // Function AuthRepo get User Data from Firestore
  Future<UserEntity> getUserData({required String userId});
}
