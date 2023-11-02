import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/student_proffile.dart';
import 'package:hedspi_learningapp/Screen/home_screen/home_screen.dart';
import 'package:hedspi_learningapp/Screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => const SplashScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  StudentProfile.routeName: (context) => const StudentProfile(),
};
