import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/ProfileData.dart';
import 'package:hedspi_learningapp/Screen/Register_Screen/FillProifileScreen/new_profile_screen.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

late bool _passwordInVisible;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String routeName = '/registerscreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String passwordFill;
  final _formKey = GlobalKey<FormState>();
  @override
  //change password visible
  void initState() {
    super.initState();
    _passwordInVisible = true;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //khi người dùng ấn vào màn hình thì sẽ ẩn bàn phím đi
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: ListView(
        children: [
          SizedBox(
            //chia màn hình làm đôi
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            child: logoSignup(context),
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
            child: Column(
              children: [
                sizedBox,
                Text(
                  'Sign Up For Free',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                Padding(
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
                          confirmPasswordInput(),
                          sizedBox,
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Student.setEmailPassword(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim());
                                Navigator.pushNamed(
                                    context, FillProfileScreen.routeName);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Next Step',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: kPrimaryColor,
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: kDefaultPadding / 2),
                                const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: kPrimaryColor,
                                  size: 22.0,
                                ),
                              ],
                            ),
                          ),
                          sizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: kPrimaryColor,
                                          fontSize: 15.0)),
                              GestureDetector(
                                onTap: () {
                                  Student.setEmailPassword(
                                      _emailController.text,
                                      _passwordController.text);
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      LoginScreen.routeName, (route) => false);
                                },
                                child: Text('Sign in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: kPrimaryColor,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ]))
                  ]),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Column logoSignup(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                soict_img,
                height: 100.0,
                width: 200.0,
              ),
              Image.asset(
                hedspi_img,
                height: 100.0,
                width: 100.0,
              ),
            ],
          ),
          sizedBox,
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
          return 'Please enter your email';
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
        passwordFill = value;
        return null;
      },
    );
  }

  TextFormField confirmPasswordInput() {
    return TextFormField(
      obscureText: _passwordInVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          color: kTextBlackColor, fontSize: 17.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        labelText: 'Confirm Pasword',
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
          return 'Please confirm your password';
          //if dose not match the regex pattern
        } else if (value != passwordFill) {
          return 'Password does not match';
        }
        return null;
      },
    );
  }
}
