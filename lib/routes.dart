import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => const SplashScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
};
