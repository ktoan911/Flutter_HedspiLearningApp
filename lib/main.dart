import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/Splash/splash_screen.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Firebase/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Tải biến môi trường từ file .env
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hedspi Learning Support App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
          elevation: 0.0,
        ),
        textTheme:
            GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
                .apply()
                .copyWith(
                  bodyLarge: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                  bodyMedium: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  bodySmall: const TextStyle(
                    color: kTextWhiteColor,
                    fontSize: 15,
                  ),
                ),
        //input decoration theme for all our the app
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle:
              TextStyle(fontSize: 15.0, color: kTextLightColor, height: 0.5),
          //hint style
          hintStyle:
              TextStyle(fontSize: 15.0, color: kTextBlackColor, height: 0.5),
          //using underline input order
          //not outline border
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor, width: 0.7)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor, width: 0.7)),
          //color change when user enter wrong in4
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kErrorBorderColor, width: 1.2)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kErrorBorderColor, width: 0.7)),
        ),
      ),

      //initial route is splash screen
      //mean first screen
      initialRoute: SplashScreen.routeName,
      //define the routes file here in order to access the routes any where in the app
      routes: routes,
    );
  }
}
