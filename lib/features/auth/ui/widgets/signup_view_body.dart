import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_app/features/auth/ui/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/ui/views/login_view.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/custom_password_field.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/dont_have_account.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/terms_and_conditions.dart';
import 'package:gap/gap.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, password;
  late bool isTermsAccepted = false;
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
              // Name TextFormField
              CustomTextFormField(
                onSaved: (value) => name = value,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
                obscureText: false,
              ),
              Gap(16),
              // Email TextFormField
              CustomTextFormField(
                onSaved: (value) => email = value,
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                obscureText: false,
              ),
              Gap(16),
              // Password TextFormField
              CustomPasswordField(onSaved: (value) => password = value),
              Gap(16),
              // Terms And Conditions
              TermsAndConditions(onChange: (value) => isTermsAccepted = value),
              Gap(30),
              // Login Button
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                            email: email!,
                            password: password!,
                            name: name!,
                          );
                    } else {
                      customSnackBar(
                        context,
                        'يجب الموافقة على الشروط والأحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              Gap(26),
              // Don't have account
              DontHaveAccount(
                question: ' تمتلك حساب بالفعل؟  ',
                answer: 'تسجيل دخول',
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
