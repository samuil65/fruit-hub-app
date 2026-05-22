import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  // LoginCubit implementation logIn With Email And Password
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await authRepo.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  // LoginCubit implementation logIn With Google
  Future<void> logInWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.logInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  // LoginCubit implementation logIn With Facebook
  Future<void> logInWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.logInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  // LoginCubit implementation logIn With Apple
  Future<void> logInWithApple() async {
    emit(LoginLoading());
    var result = await authRepo.logInWithApple();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
