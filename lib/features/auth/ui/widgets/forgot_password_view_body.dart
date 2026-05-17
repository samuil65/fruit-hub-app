import 'package:flutter/cupertino.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Text
          Text(
            'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF616A6B),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.40,
            ),
          ),
          Gap(31),
          // phone number TextFormField
          CustomTextFormField(
            hintText: 'رقم الموبايل',
            textInputType: TextInputType.numberWithOptions(),
            obscureText: false,
          ),
          Gap(31),
          // forgot password button
          CustomButton(onPressed: () {}, text: 'نسيت كلمة المرور'),
        ],
      ),
    );
  }
}
