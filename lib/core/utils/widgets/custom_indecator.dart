import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CupertinoActivityIndicator(),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
