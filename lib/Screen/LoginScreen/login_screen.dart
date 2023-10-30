import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = '/loginscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          //chia màn hình làm đôi
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.8,
          child: const Column(children: []),
        )
      ],
    ));
  }
}
