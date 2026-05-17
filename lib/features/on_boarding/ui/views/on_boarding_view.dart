import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/on_boarding/ui/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnBoardingViewBody()));
  }
}
