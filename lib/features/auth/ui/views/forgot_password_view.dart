import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/login_widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: customAppBar(context, title: 'نسيان كلمة المرور'),
        body: const ForgotPasswordViewBody(),
      ),
    );
  }
}
