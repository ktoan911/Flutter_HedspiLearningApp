// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedspi_learningapp/ProfileData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Component/local_storage.dart';
import 'package:hedspi_learningapp/Firebase/firebase_auth_implemention/firebase_auth_services.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splashscreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    closeKeyboard();
    Future.delayed(const Duration(seconds: 5), () {
      checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hedspi Learning Support App', style: TextStyle(fontSize: 25)),
            Text('made by ktoan_911', style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

void checkLogin(BuildContext context) async {
  await SecureStorage.checkIsLogin(DataSave.isLoginKey);
  if (DataSave.isLoginSave == true) {
    autoLogin(context, DataSave.emailSave, DataSave.passwordSave);
  } else {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }
}

void autoLogin(BuildContext context, String email, String password) async {
  final FireBaseAuthService auth = FireBaseAuthService();
  User? user = await auth.logInWithEmailAndPassword(email, password);
  if (user != null) {
    Student.uid = user.uid;
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  } else {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }
}

void closeKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
