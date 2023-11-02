// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF345FB4);
const Color kSecondaryColor = Color(0xFF6789CA);
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kTextLightColor = Color(0xFFACACAC);
const Color kErrorBorderColor = Color(0xFFB00020);

const kDefaultPadding = 20.0;

const sizedBox = SizedBox(height: kDefaultPadding);

class SizeBoxOpt extends StatelessWidget {
  const SizeBoxOpt({
    Key? key,
    required this.high,
  }) : super(key: key);

  final double high;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: high);
  }
}

const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

const String emailPattern =
    r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';

const String soict_img = 'assets/images/soict.png';
const String hedspi_img = 'assets/images/hedspi.png';

const String ask_icon = 'assets/icons/ask.svg';
const String assignment_icon = 'assets/icons/assignment.svg';
const String calenda_icon = 'assets/icons/calenda.svg';
const String event_icon = 'assets/icons/event.svg';
const String gallery_icon = 'assets/icons/gallery.svg';
const String lock_icon = 'assets/icons/lock.svg';
const String result_icon = 'assets/icons/quiz.svg';
const String resume_icon = 'assets/icons/resume.svg';
const String setting_icon = 'assets/icons/setting.svg';
const String logout_icon = 'assets/icons/logout.svg';

class Student {
  static String name = 'Nguyen Khanh Toan';
  static String classes = 'J6';
  static String birth = '20/10/2004';
  static int numOutCourse = 0;
  static String regisNum = '2022-HUST-2609';
  // ignore: non_constant_identifier_names
  static String student_img = 'assets/images/student.png';
  static String email = 'abc@gmai.com';
  static String phonenumber = '090xxxxxxx';
  static String studentID = '202260xxx';
  static String hometown = 'Ha Noi';
  static String fatherName = 'Nguyen Van A';
  static String motherName = 'Nguyen Thi B';
}
