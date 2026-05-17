import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/signup_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/signupView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              ' حساب جديد',
              style: TextStyle(
                color: const Color(0xFF0C0D0D),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SignUpViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
