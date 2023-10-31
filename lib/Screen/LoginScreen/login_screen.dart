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
          //color: Colors.blue,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/soict.png',
                      height: 150.0,
                      width: 200.0,
                    ),
                    Image.asset(
                      'assets/images/hedspi.png',
                      height: 100.0,
                      width: 150.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Hi ',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 35.5,
                        color: kTextWhiteColor),
                  ),
                  Text('Student',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kTextWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.5,
                          ))
                ]),
                const SizedBox(
                  // tạo khoảng trống cố định
                  height: kDefaultPadding,
                ),
                Text('Sign in to continue',
                    style: Theme.of(context).textTheme.bodyMedium)
              ]),
        ),
        const SizedBox(height: kDefaultPadding),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 3),
                topRight: Radius.circular(kDefaultPadding * 3),
              ),
              color: kOtherColor,
            ))
      ],
    ));
  }
}
