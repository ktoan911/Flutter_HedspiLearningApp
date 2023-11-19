import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/Ask/ask_screen.dart';
import 'package:hedspi_learningapp/Screen/Dictionary/dictionary.dart';
import 'package:hedspi_learningapp/Screen/Note/note_screen.dart';
import 'package:hedspi_learningapp/Screen/Register_Screen/FillProifileScreen/new_profile_screen.dart';
import 'package:hedspi_learningapp/Screen/Result/add_result_screen.dart';
import 'package:hedspi_learningapp/Screen/Result/result_screen.dart';
import 'package:hedspi_learningapp/Screen/Assignment_Screen/assignment_screen.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/Register_Screen/register_screen.dart';
import 'package:hedspi_learningapp/Screen/Schooler/schooler_screen.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/student_proffile.dart';
import 'package:hedspi_learningapp/Screen/home_screen/home_screen.dart';
import 'package:hedspi_learningapp/Screen/Splash/splash_screen.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/timetabl_screen.dart';

Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => const SplashScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  AssignmentScreen.routeName: (context) => const AssignmentScreen(),
  StudentProfile.routeName: (context) => const StudentProfile(),
  NoteScreen.routeName: (context) => const NoteScreen(),
  ResultScreen.routeName: (context) => const ResultScreen(),
  TimeTable.routeName: (context) => const TimeTable(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  FillProfileScreen.routeName: (context) => const FillProfileScreen(),
  AddResultScreen.routeName: (context) => AddResultScreen(),
  DictionaryScreen.routeName: (context) => const DictionaryScreen(),
  AskScreen.routeName: (context) => const AskScreen(),
  SchoolerScreen.routeName: (context) => const SchoolerScreen(),
};
