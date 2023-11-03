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
const String note_icon = 'assets/icons/note.svg';
const String resume_icon = 'assets/icons/resume.svg';
const String setting_icon = 'assets/icons/setting.svg';
const String logout_icon = 'assets/icons/logout.svg';
