import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/core/utils/constants/backend_endpoints.dart';
import 'package:fruit_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  // AuthRepo implementation create User With Email And Password
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(email: email, name: name, userId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
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
      var userEntity = await getUserData(userId: user.uid);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl in logInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Google
  @override
  Future<Either<Failure, UserEntity>> logInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.logInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        userId: user.uid,
      );
      if (isUserExists) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl in logInWithGoogle: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Facebook
  @override
  Future<Either<Failure, UserEntity>> logInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.logInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        userId: user.uid,
      );
      if (isUserExists) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl in logInWithFacebook: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // AuthRepo implementation logIn With Apple
  @override
  Future<Either<Failure, UserEntity>> logInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.logInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExists,
        userId: user.uid,
      );
      if (isUserExists) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl in logInWithApple: ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  // *------------------------------- Firestore Functions ------------------*

  // Function delete User
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  // AuthRepo implementation add User Data to Firestore
  @override
  Future addUserData({required UserEntity user}) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addUserData,
        data: user.toMap(),
        userId: user.userId,
      );
    } catch (e) {
      log('Exception in AuthRepoImpl in addUserData: ${e.toString()}');
    }
  }

  // AuthRepo implementation get User Data from Firestore
  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      userId: userId,
    );
    return UserModel.fromJson(userData);
  }
}
