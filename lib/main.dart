import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/splash_screen.dart';
import 'package:hedspi_learningapp/constant.dart';
import 'package:hedspi_learningapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hedspi Learning Support App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
      ),
      //initial route is splash screen
      //mean first screen
      initialRoute: SplashScreen.routeName,
      //define the routes file here in order to access the routes any where in the app
      routes: routes,
    );
  }
}
