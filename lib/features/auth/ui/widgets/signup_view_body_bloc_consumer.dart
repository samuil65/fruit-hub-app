import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {}
        if (state is SignUpFailure) {
          customSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
