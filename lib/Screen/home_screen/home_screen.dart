// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Note/note_screen.dart';
import 'package:hedspi_learningapp/Result/result_data.dart';
import 'package:hedspi_learningapp/Result/result_screen.dart';
import 'package:hedspi_learningapp/Screen/Assignment_Screen/assignment_screen.dart';
import 'package:hedspi_learningapp/Screen/LoginScreen/login_screen.dart';
import 'package:hedspi_learningapp/Screen/home_screen/Widget/Student_Data.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/TimeTable/timetabl_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = '/homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    data: '${SumScore(resultList)} / ${resultList.length * 10}',
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
                            const HomeOptionSelect(
                                onPress: null, icon: ask_icon, title: 'Ask'),
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
                            const HomeOptionSelect(
                                onPress: null,
                                icon: translate_icon,
                                title: 'Translation'),
                          ],
                        ),
                        const SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: () {
                                  _launchURL(Uri.parse('https://flutter.dev'));
                                },
                                icon: resume_icon,
                                title: 'Resume'),
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

Future<void> loadData(BuildContext context, String route) async {
  // Thực hiện tải lại dữ liệu ở đây (đảm bảo bạn cập nhật dữ liệu từ nguồn dữ liệu mới)

  // Chờ 1 khoảng thời gian ngắn để mô phỏng việc tải lại dữ liệu
  await Future.delayed(const Duration(seconds: 1));

  // Thay thế màn hình hiện tại bằng màn hình kết quả
  Navigator.pushReplacementNamed(context, route);
}
