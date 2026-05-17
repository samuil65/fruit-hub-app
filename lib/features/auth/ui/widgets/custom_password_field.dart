import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/widgets/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      obscureText: isObscure,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => isObscure = !isObscure),
        child: isObscure
            ? Icon(CupertinoIcons.eye_fill, color: const Color(0xFF949D9E))
            : Icon(
                CupertinoIcons.eye_slash_fill,
                color: const Color(0xFF949D9E),
              ),
      ),
    );
  }
}
