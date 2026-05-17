import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      child: Icon(Icons.arrow_back_ios_new),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: const Color(0xFF0C0D0D),
        fontSize: 19,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
