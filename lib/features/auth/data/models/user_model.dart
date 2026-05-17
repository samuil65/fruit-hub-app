import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.userId});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      userId: user.uid,
    );
  }
}
