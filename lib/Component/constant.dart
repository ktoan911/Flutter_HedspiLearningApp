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
const Color kDarkModeColor = Color(0xFF000000);
const Color kLightModeColor = Color(0xFF345FB4);

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
const String ask_icon = 'assets/icons/gallery.svg';
const String assignment_icon = 'assets/icons/assignment.svg';
const String calenda_icon = 'assets/icons/calenda.svg';
const String event_icon = 'assets/icons/event.svg';
const String gallery_icon = 'assets/icons/gallery.svg';
const String lock_icon = 'assets/icons/lock.svg';
const String note_icon = 'assets/icons/note.svg';
const String resume_icon = 'assets/icons/resume.svg';
const String setting_icon = 'assets/icons/setting.svg';
const String logout_icon = 'assets/icons/logout.svg';
const String translate_icon = 'assets/icons/translate.svg';

List<Color> backgroundColors = [
  const Color(0xFFCCE5FF), // light blue
  const Color(0xFFD7F9E9), // pale green
  const Color(0xFFFFF8E1), // pale yellow
  const Color(0xFFF5E6CC), // beige
  const Color(0xFFFFD6D6), // light pink
  const Color(0xFFE5E5E5), // light grey
  const Color(0xFFFFF0F0), // pale pink
  const Color(0xFFE6F9FF), // pale blue
  const Color(0xFFD4EDDA), // mint green
  const Color(0xFFFFF3CD), // pale orange
];

class StudentProfileConst {
  static const String name = 'Name';
  static const String Class = 'Class';
  static const String birth = 'Birth';
  static const String studyYear = 'Study Year';
  static const String phoneNumber = 'Phone Number';
  static const String studentID = 'Student ID';
  static const String homeTown = 'HomeTown';
  static const String uid = 'uid';
}

class FirebaseStringConst {
  static const ProfileCollection = 'UserProfile';
  static const NoteCollection = 'Note';
  static const ResultCollection = 'Result';
}

class DataSave {
  static const String emailKey = 'email';
  static const String passwordKey = 'password';
  static const String isLoginKey = 'isLogin';

  static String emailSave = '';
  static String passwordSave = '';
  static bool isLoginSave = false;
}
