import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Note/note_screen.dart';
import 'package:hedspi_learningapp/Screen/Assignment_Screen/assignment_screen.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/student_proffile.dart';
import 'package:hedspi_learningapp/Screen/home_screen/home_screen.dart';
import 'package:hedspi_learningapp/Screen/Splash/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => const SplashScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  AssignmentScreen.routeName: (context) => const AssignmentScreen(),
  StudentProfile.routeName: (context) => const StudentProfile(),
  NoteScreen.routeName: (context) => const NoteScreen(),
};
