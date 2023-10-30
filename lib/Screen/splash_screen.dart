import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';

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
    // Đợi 5 giây sau đó điều hướng đến màn hình đăng nhập
    Future.delayed(const Duration(seconds: 10), () {
      print('Splash Screen');
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
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
