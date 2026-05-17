import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });

  final String title;
  final String leadingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFDCDEDE)),
          borderRadius: BorderRadius.circular(16),
        ),
        leading: SvgPicture.asset(leadingIcon),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
