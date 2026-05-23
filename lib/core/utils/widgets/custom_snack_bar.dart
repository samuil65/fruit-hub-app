import 'package:flutter/material.dart';

// Custom SnackBar for displaying error messages
void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colors.black54),
  );
}

// Custom SnackBar for displaying success messages
void customSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    ),
  );
}

// Custom Dialog for displaying success messages
void customSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(
      child: Material(
        color: Colors.transparent,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white, size: 50),
        ),
      ),
    ),
  );
}
