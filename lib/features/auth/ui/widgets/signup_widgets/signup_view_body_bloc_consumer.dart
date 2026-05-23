import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_indecator.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/ui/views/login_view.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/signup_widgets/signup_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          customSuccessSnackBar(context, 'تم إنشاء الحساب بنجاح');
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          });
        }
        if (state is SignUpFailure) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomIndecator(
          isLoading: state is SignUpLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
