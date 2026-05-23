import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_indecator.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/login_widgets/login_view_body.dart';
import 'package:fruit_hub_app/features/home/ui/views/home_view.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          customSuccessDialog(context);
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          });
        }
        if (state is LoginFailure) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomIndecator(
          isLoading: state is LoginLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
