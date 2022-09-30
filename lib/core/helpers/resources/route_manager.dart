import 'package:flutter/material.dart';
import 'package:foody/views/screens/forgot_password_screen.dart';
import 'package:foody/views/screens/login_screen.dart';
import 'package:foody/views/screens/sign_up_screen.dart';

class Routes {
  static const String loginScreen = '/';
  static const String signUpScreen = 'signUpScreen';
  static const String forgotPasswordScreen = 'forgotPasswordScreen ';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
    }
    return null;
  }
}
