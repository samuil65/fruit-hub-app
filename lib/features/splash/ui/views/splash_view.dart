import 'package:flutter/material.dart';
import 'package:fruit_hub_app/constants.dart';
import 'package:fruit_hub_app/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub_app/features/auth/ui/views/login_view.dart';
import 'package:fruit_hub_app/features/on_boarding/ui/views/on_boarding_view.dart';
import 'package:fruit_hub_app/features/splash/ui/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }

  // This function will navigate to the next screen after 3 seconds
  void excuteNavigation() {
    bool isOnBoardingSeen = Prefs.getBool(kIsOnBoardingSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
