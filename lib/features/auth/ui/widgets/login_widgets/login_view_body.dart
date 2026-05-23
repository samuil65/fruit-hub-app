import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/utils/constants/app_colors.dart';
import 'package:fruit_hub_app/core/utils/constants/app_images.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub_app/features/auth/ui/views/signup_view.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/custom_list_tile.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/custom_or_divider.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/custom_password_field.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/dont_have_account.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              // Email TextFormField
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                obscureText: false,
              ),
              Gap(16),
              // Password TextFormField
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              Gap(16),
              // Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(
                        color: AppColors.lightPrimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(33),
              // Login Button
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().logInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              Gap(33),
              // Don't have account
              DontHaveAccount(
                question: 'لا تمتلك حساب؟  ',
                answer: 'قم بأنشاء حساب',
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignUpView.routeName);
                },
              ),
              Gap(45),
              // Or Divider
              CustomOrDivider(),
              Gap(22),
              // Sign in with Google
              CustomListTile(
                title: 'تسجيل بواسطة جوجل',
                leadingIcon: Assets.assetsImagesGoogleicon,
                onTap: () {
                  context.read<LoginCubit>().logInWithGoogle();
                },
              ),
              Gap(5),
              // Sign in with Apple
              Platform.isIOS
                  ? CustomListTile(
                      title: 'تسجيل بواسطة أبل',
                      leadingIcon: Assets.assetsImagesAppleicon,
                      onTap: () {
                        context.read<LoginCubit>().logInWithApple();
                      },
                    )
                  : const Gap(5),
              Gap(5),
              // Sign in with Facebook
              CustomListTile(
                title: 'تسجيل بواسطة فيسبوك',
                leadingIcon: Assets.assetsImagesFacebookicon,
                onTap: () {
                  context.read<LoginCubit>().logInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
