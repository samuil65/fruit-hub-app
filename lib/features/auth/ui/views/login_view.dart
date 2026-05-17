import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/login_view_body.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/loginView';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => LoginCubit(GetIt.instance<AuthRepo>()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'تسجيل دخول',
              style: TextStyle(
                color: const Color(0xFF0C0D0D),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
