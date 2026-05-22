import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});

  // AuthRepo implementation create User With Email And Password
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl in createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Email And Password
  @override
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl in signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Google
  @override
  Future<Either<Failure, UserEntity>> logInWithGoogle() async {
    try {
      var user = await firebaseAuthService.logInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Facebook
  @override
  Future<Either<Failure, UserEntity>> logInWithFacebook() async {
    try {
      var user = await firebaseAuthService.logInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Apple
  @override
  Future<Either<Failure, UserEntity>> logInWithApple() async {
    try {
      var user = await firebaseAuthService.logInWithApple();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl in signInWithApple: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }
}
