import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  // implement createUserWithEmailAndPassword
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
