import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub_app/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  // Function create User With Email And Password
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

  // Function log In With Email And Password
  Future<User> logInWithEmailAndPassword({
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

  // Function log In With Google
  Future<User> logInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  // Function log In With Facebook
  Future<User> logInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  // Function log In With Apple
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> logInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }
  // *---------- enf of log In With Apple ----------*

  // Function delete User
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
