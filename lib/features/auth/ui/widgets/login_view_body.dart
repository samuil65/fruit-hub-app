import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_app/features/auth/ui/views/signup_view.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/custom_list_tile.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/dont_have_account.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Email TextFormField
            CustomTextFormField(
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            Gap(16),
            // Password TextFormField
            CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: Icon(
                CupertinoIcons.eye_fill,
                color: const Color(0xFF949D9E),
              ),
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
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
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
            // Or
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(color: const Color(0xFFDCDEDE), thickness: 2),
                ),
                Gap(15),
                Text(
                  'أو',
                  style: TextStyle(
                    color: const Color(0xFF0C0D0D),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(15),
                Expanded(
                  child: Divider(color: const Color(0xFFDCDEDE), thickness: 2),
                ),
              ],
            ),
            Gap(22),
            // Sign in with Google
            CustomListTile(
              title: 'تسجيل بواسطة جوجل',
              leadingIcon: Assets.assetsImagesGoogleicon,
              onTap: () {},
            ),
            Gap(16),
            // Sign in with Apple
            CustomListTile(
              title: 'تسجيل بواسطة أبل',
              leadingIcon: Assets.assetsImagesAppleicon,
              onTap: () {},
            ),
            Gap(16),
            // Sign in with Facebook
            CustomListTile(
              title: 'تسجيل بواسطة فيسبوك',
              leadingIcon: Assets.assetsImagesFacebookicon,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
