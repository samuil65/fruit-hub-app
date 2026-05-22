import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: const Color(0xFFDCDEDE), thickness: 2)),
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
        Expanded(child: Divider(color: const Color(0xFFDCDEDE), thickness: 2)),
      ],
    );
  }
}
