// ignore_for_file: constant_identifier_names, non_constant_identifier_names

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
const String schooler_icon = 'assets/icons/Schooler.svg';

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
  static const AssignmentCollection = 'Assignment';
  static const TimetableCollection = 'Timetable';
}

class DataSave {
  static const String emailKey = 'email';
  static const String passwordKey = 'password';
  static const String isLoginKey = 'isLogin';

  static String emailSave = '';
  static String passwordSave = '';
  static bool isLoginSave = false;
}

class Weekday {
  static const String monday = 'Monday';
  static const String tuesday = 'Tuesday';
  static const String wednesday = 'Wednesday';
  static const String thursday = 'Thursday';
  static const String friday = 'Friday';
  static const String saturday = 'Saturday';
  static const String sunday = 'Sunday';
}

List<String> majors = [
  'Nganh_An toàn thông tin',
  'Nganh_Công nghệ da giày',
  'Nganh_Công nghệ dệt, may',
  'Nganh_Công nghệ giáo dục',
  'Nganh_Công nghệ kỹ thuật cơ khí',
  'Nganh_Công nghệ may',
  'Nganh_Công nghệ thông tin',
  'Nganh_Công nghệ thực phẩm',
  'Nganh_Dệt May K66',
  'Nganh_Dệt May K67',
  'Nganh_Hóa học',
  'Nganh_Hệ thống thông tin',
  'Nganh_Hệ thống thông tin quản lý',
  'Nganh_Khoa học dữ liệu',
  'Nganh_Khoa học máy tính',
  'Nganh_Khoa học và Kỹ thuật vật liệu',
  'Nganh_Kinh tế công nghiệp',
  'Nganh_Kế toán',
  'Nganh_Kỹ thuật cơ khí',
  'Nganh_Kỹ thuật cơ khí động lực',
  'Nganh_Kỹ thuật cơ điện tử',
  'Nganh_Kỹ thuật dệt',
  'Nganh_Kỹ thuật hàng không',
  'Nganh_Kỹ thuật hóa học',
  'Nganh_Kỹ thuật hạt nhân',
  'Nganh_Kỹ thuật in',
  'Nganh_Kỹ thuật in và Truyền thông',
  'Nganh_Kỹ thuật máy tính',
  'Nganh_Kỹ thuật môi trường',
  'Nganh_Kỹ thuật nhiệt',
  'Nganh_Kỹ thuật phần mềm',
  'Nganh_Kỹ thuật sinh học',
  'Nganh_Kỹ thuật thực phẩm',
  'Nganh_Kỹ thuật tàu thủy',
  'Nganh_Kỹ thuật vật liệu',
  'Nganh_Kỹ thuật vật liệu kim loại',
  'Nganh_Kỹ thuật y sinh',
  'Nganh_Kỹ thuật Ô tô',
  'Nganh_Kỹ thuật ĐK-TĐH & Hệ thống điện (CTTT)',
  'Nganh_Kỹ thuật Điện tử viễn thông',
  'Nganh_Kỹ thuật điều khiển và tự động hóa',
  'Nganh_Kỹ thuật điện',
  'Nganh_Kỹ thuật điện tử - viễn thông',
  'Nganh_Logistic và Quản lý chuỗi cung ứng',
  'Nganh_Mạng máy tính và truyền thông dữ liệu',
  'Nganh_Ngôn ngữ Anh',
  'Nganh_Quản lý công nghiệp',
  'Nganh_Quản lý tài nguyên và Môi trường',
  'Nganh_Quản trị kinh doanh',
  'Nganh_Sư phạm Kỹ thuật công nghiệp',
  'Nganh_Toán-Tin',
  'Nganh_Truyền thông số và Kỹ thuật đa phương tiện',
  'Nganh_Tài chính-Ngân hàng',
  'Nganh_Vật lý Y khoa',
  'Nganh_Vật lý kỹ thuật'
];

List<String> Semester = ['1', '2'];
List<String> TrainingPoint = List.generate(101, (index) => index.toString());
List<String> ki_hoc = List.generate(7, (index) => (index + 61).toString());
