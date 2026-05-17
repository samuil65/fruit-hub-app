import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.obscureText,
    this.suffixIcon,
    this.onSaved,
  });
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: const Color(0xFF949D9E),
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        border: customBorder(),
        enabledBorder: customBorder(),
        focusedBorder: customBorder(),
      ),
    );
  }
}

OutlineInputBorder customBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: const Color(0xFFE6E9E9), width: 1.2),
  );
}
