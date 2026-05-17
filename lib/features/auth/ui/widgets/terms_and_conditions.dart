import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/features/auth/ui/widgets/custom_check_box.dart';
import 'package:gap/gap.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Custom CheckBox
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            setState(() {
              widget.onChange(value);
              isTermsAccepted = value;
            });
          },
        ),
        Gap(16),
        // Terms And Conditions Text
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.7,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
