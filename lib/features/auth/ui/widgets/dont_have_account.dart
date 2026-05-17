import 'package:flutter/cupertino.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.question,
    required this.answer,
    required this.onTap,
  });
  final String question, answer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            color: const Color(0xFF949D9E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            answer,
            style: TextStyle(
              color: const Color(0xFF1B5E37),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
