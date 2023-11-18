// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hedspi_learningapp/ProfileData.dart';
import 'package:hedspi_learningapp/Component/local_storage.dart';
import 'package:hedspi_learningapp/Screen/Ask/ask_screen.dart';
import 'package:hedspi_learningapp/Firebase/FirebaseFunc.dart';
import 'package:hedspi_learningapp/Screen/Dictionary/dictionary.dart';
import 'package:hedspi_learningapp/Screen/Note/note_screen.dart';
import 'package:hedspi_learningapp/Screen/Result/result_data.dart';
import 'package:hedspi_learningapp/Screen/Result/result_screen.dart';
import 'package:hedspi_learningapp/Screen/Assignment_Screen/assignment_screen.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/home_screen/Widget/Student_Data.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/timetabl_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = '/homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _data;

  @override
  void initState() {
    super.initState();
    // Khởi tạo Future để tải dữ liệu
    _data = fetchData();
  }

  Future<void> fetchData() async {
    // Thực hiện tải dữ liệu
    await Future.delayed(
        const Duration(seconds: 3)); // Giả sử là quá trình tải mất 2 giây
    return initialLoadHomePage(
        Student.uid); // Thay bằng hàm thực hiện tải dữ liệu của bạn
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Trạng thái đang đợi (đang tải dữ liệu)
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Trạng thái lỗi
              return Text('Lỗi: ${snapshot.error}');
            } else {
              // Trạng thái hoàn thành, dữ liệu đã tải xong
              Student.averageScore = SumScore(resultList);
              return const homePage();
            }
          },
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class homePage extends StatelessWidget {
  const homePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.all(kDefaultPadding),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          name: Student.name,
                        ),
                        const SizeBoxOpt(high: kDefaultPadding / 2),
                        StudentInfo(
                          classgrade: Student.classes,
                        ),
                        const SizeBoxOpt(high: kDefaultPadding / 2),
                        StudentYearLearning(year: Student.studyYear)
                      ]),
                  const SizeBoxOpt(high: kDefaultPadding / 4),
                  StudentPicture(
                    studentimg: Student.student_img,
                  ),
                ],
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const HighLightInfo(
                    title: 'Attendance',
                    data: '100%',
                  ),
                  HighLightInfo(
                    onPress: () {
                      Navigator.pushNamed(context, ResultScreen.routeName);
                    },
                    title: 'Average Score',
                    data: '${Student.averageScore} / 4.0',
                  ),
                ],
              )
            ]),
          ),
          //other will use all the remaining height of screen
          Expanded(
            child: Container(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: kOtherColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 3),
                      topRight: Radius.circular(kDefaultPadding * 3),
                    ),
                  ),
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, AskScreen.routeName);
                                },
                                icon: ask_icon,
                                title: 'Ask with Bard'),
                            HomeOptionSelect(
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, AssignmentScreen.routeName);
                                },
                                icon: assignment_icon,
                                title: 'Assignment'),
                          ],
                        ),
                        const SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, TimeTable.routeName);
                                },
                                icon: calenda_icon,
                                title: 'TimeTable'),
                            HomeOptionSelect(
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, DictionaryScreen.routeName);
                                },
                                icon: translate_icon,
                                title: 'Dictionary'),
                          ],
                        ),
                        const SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: () {
                                  _launchURL(
                                      Uri.parse('https://ctt.hust.edu.vn/'));
                                },
                                icon: event_icon,
                                title: 'CTT HUST'),
                            HomeOptionSelect(
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, NoteScreen.routeName);
                                },
                                icon: note_icon,
                                title: 'Note'),
                          ],
                        ),
                        const SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const HomeOptionSelect(
                                onPress: null,
                                icon: setting_icon,
                                title: 'Setting'),
                            HomeOptionSelect(
                                onPress: () {
                                  FirebaseAuth.instance.signOut();
                                  setDataLoginCurrent(false, '', '');
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      LoginScreen.routeName, (route) => false);
                                },
                                icon: logout_icon,
                                title: 'Log out'),
                          ],
                        ),
                      ]),
                )),
          )
        ],
      ),
    );
  }
}

class HomeOptionSelect extends StatelessWidget {
  const HomeOptionSelect({
    Key? key,
    this.onPress,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final VoidCallback? onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 40.0,
              width: 40.0,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            sizedBox,
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
