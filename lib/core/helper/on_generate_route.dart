import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/auth/ui/views/forgot_password_view.dart';
import 'package:fruit_hub_app/features/auth/ui/views/login_view.dart';
import 'package:fruit_hub_app/features/auth/ui/views/signup_view.dart';
import 'package:fruit_hub_app/features/home/ui/views/home_view.dart';
import 'package:fruit_hub_app/features/on_boarding/ui/views/on_boarding_view.dart';
import 'package:fruit_hub_app/features/splash/ui/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case ForgotPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
