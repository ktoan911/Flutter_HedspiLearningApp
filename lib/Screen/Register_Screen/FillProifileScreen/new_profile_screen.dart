// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Component/custom_btn.dart';
import 'package:hedspi_learningapp/Component/local_storage.dart';
import 'package:hedspi_learningapp/Firebase/FirebaseFunc.dart';
import 'package:hedspi_learningapp/Screen/home_screen/home_screen.dart';
import 'package:hedspi_learningapp/Firebase/firebase_auth_implemention/firebase_auth_services.dart';

final FireBaseAuthService _auth = FireBaseAuthService();

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  static String routeName = '/fillprofilescreen';

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding),
                    topRight: Radius.circular(kDefaultPadding))),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              sizedBox,
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Student.student_img),
                backgroundColor: kSecondaryColor,
              ),
              sizedBox,
              Form(
                key: _formKey,
                child: const Column(
                  children: [
                    ProfileFill(title: StudentProfileConst.name),
                    sizedBox,
                    ProfileFill(title: StudentProfileConst.Class),
                    sizedBox,
                    ProfileFill(title: StudentProfileConst.birth),
                    sizedBox,
                    ProfileFill(title: StudentProfileConst.studyYear),
                    sizedBox,
                    ProfileFill(title: StudentProfileConst.phoneNumber),
                    sizedBox,
                    ProfileFill(title: StudentProfileConst.studentID),
                    sizedBox,
                    ProfileFill(title: StudentProfileConst.homeTown),
                    SizeBoxOpt(high: kDefaultPadding * 2),
                  ],
                ),
              ),
              DefaultBtn(
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _signUp(context);
                    }
                  },
                  title: 'SIGN UP',
                  icon: Icons.arrow_forward_sharp),
              const SizeBoxOpt(high: kDefaultPadding * 5),
            ]),
          ),
        )
      ]),
    );
  }
}

class ProfileFill extends StatelessWidget {
  const ProfileFill({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: TextFormField(
        onChanged: (value) {
          updateStudent(title, value.trim());
        },
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          labelText: title,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
        ),
        validator: (value) {
          //FORM VALIDATION
          if (value == null || value.isEmpty) {
            return 'Please enter your $title';
            //if dose not match the regex pattern
          }
          return null;
        },
      ),
    );
  }
}

void updateStudent(String field, String value) {
  switch (field) {
    case StudentProfileConst.name:
      Student.name = value;
      break;
    case StudentProfileConst.birth:
      Student.birth = value;
      break;
    case StudentProfileConst.Class:
      Student.classes = value;
      break;
    case StudentProfileConst.studyYear:
      Student.studyYear = value;
      break;
    case StudentProfileConst.phoneNumber:
      Student.phonenumber = value;
      break;
    case StudentProfileConst.studentID:
      Student.studentID = value;
      break;
    case StudentProfileConst.homeTown:
      Student.hometown = value;
      break;
    default:
      break;
  }
}

void _signUp(BuildContext context) async {
  String email = Student.email;
  String password = Student.password;
  User? user = await _auth.signUpWithEmailAndPassword(email, password);

  if (user != null) {
    Student.uid = user.uid;
    Student.email = email;
    setDataLoginCurrent(true, email, password);
    addUserDetail(
        Student.name,
        Student.birth,
        Student.classes,
        Student.hometown,
        Student.phonenumber,
        Student.studentID,
        Student.student_img,
        Student.studyYear,
        user.uid,
        Student.email);
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  } else {
    var mySnackBar = SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        errorLogin,
        style: const TextStyle(color: kTextWhiteColor),
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
  }
}
