import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';

class FirebaseAuthService {
  // Function createUserWithEmailAndPassword
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception from FirebaseAuthService in createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
          message: 'الحساب موجود بالفعل لهذا البريد الإلكتروني.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          message:
              'حدث خطأ في الاتصال بالشبكة، يرجى التحقق من الاتصال بالانترنت.',
        );
      } else {
        throw CustomExceptions(
          message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exception from FirebaseAuthService in createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExceptions(
        message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى.',
      );
    }
  }

  // Function signInWithEmailAndPassword
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception from FirebaseAuthService in signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomExceptions(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          message:
              'حدث خطأ في الاتصال بالشبكة، يرجى التحقق من الاتصال بالانترنت.',
        );
      } else {
        throw CustomExceptions(
          message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exception from FirebaseAuthService in signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExceptions(
        message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى.',
      );
    }
  }
}
