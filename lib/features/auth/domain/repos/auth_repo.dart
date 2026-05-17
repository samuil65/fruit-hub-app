import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  // Function AuthRepo createUserWithEmailAndPassword
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  // Function AuthRepo signInWithEmailAndPassword
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
