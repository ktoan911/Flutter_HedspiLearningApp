// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Component/custom_btn.dart';
import 'package:hedspi_learningapp/Screen/Register_Screen/register_screen.dart';
import 'package:hedspi_learningapp/Screen/home_screen/home_screen.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Firebase/firebase_auth_implemention/firebase_auth_services.dart';

late bool _passwordInVisible;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  //change password visible
  void initState() {
    super.initState();
    _passwordInVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //khi người dùng ấn vào màn hình thì sẽ ẩn bàn phím đi
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            //chia màn hình làm đôi
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.8,
            child: logoLogin(context),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 3),
                topRight: Radius.circular(kDefaultPadding * 3),
              ),
              color: kOtherColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(children: [
                Form(
                    key: _formKey,
                    child: Column(children: [
                      sizedBox,
                      emailInput(),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      passwordInput(),
                      sizedBox,
                      DefaultBtn(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              _logIn(context);
                            }
                          },
                          title: 'SIGN IN',
                          icon: Icons.arrow_forward_outlined),
                      sizedBox,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('Forgot Password',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: kPrimaryColor, fontSize: 15.0)),
                      ),
                      sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: kPrimaryColor, fontSize: 15.0),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RegisterScreen.routeName, (route) => false);
                            },
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: kPrimaryColor, fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    ]))
              ]),
            ),
          )
        ],
      )),
    );
  }

  Column logoLogin(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                soict_img,
                height: 150.0,
                width: 200.0,
              ),
              Image.asset(
                hedspi_img,
                height: 150.0,
                width: 100.0,
              ),
            ],
          ),
          sizedBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Hi ',
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 40,
                  color: kTextWhiteColor),
            ),
            Text('Student', style: Theme.of(context).textTheme.bodyLarge)
          ]),
          sizedBox,
          Text('Sign in to continue',
              style: Theme.of(context).textTheme.bodyMedium)
        ]);
  }

  TextFormField emailInput() {
    return TextFormField(
      controller: _emailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 17.0, fontWeight: FontWeight.w300),
      decoration: const InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        //FORM VALIDATION
        RegExp regex = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
          //if dose not match the regex pattern
        } else if (!regex.hasMatch(value)) {
          return 'Enter Valid Email';
        }
        return null;
      },
    );
  }

  TextFormField passwordInput() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _passwordInVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 17.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        labelText: 'Pasword',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordInVisible = !_passwordInVisible;
            });
          },
          icon: Icon(
            _passwordInVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        //FORM VALIDATION
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
          //if dose not match the regex pattern
        } else if (value.length < 6) {
          return 'Minimum 6 characters required';
        }
        return null;
      },
    );
  }

  void _logIn(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.logInWithEmailAndPassword(email, password);

    if (user != null) {
      Student.uid = user.uid;
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } else {
      print('Login failed');
    }
  }
}
