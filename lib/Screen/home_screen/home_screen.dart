import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hedspi_learningapp/Screen/home_screen/Widget/Student_Data.dart';
import 'package:hedspi_learningapp/constant.dart';

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
                        const StudentYearLearning(year: '2023 - 2024')
                      ]),
                  const SizeBoxOpt(high: kDefaultPadding / 4),
                  StudentPicture(
                    studentimg: Student.student_img,
                  ),
                ],
              ),
              sizedBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HighLightInfo(
                    title: 'Attendance',
                    data: '100%',
                  ),
                  HighLightInfo(
                    title: 'Average Score',
                    data: '9.8/10',
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
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: null, icon: ask_icon, title: 'Ask'),
                            HomeOptionSelect(
                                onPress: null,
                                icon: assignment_icon,
                                title: 'Assignment'),
                          ],
                        ),
                        SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: null,
                                icon: calenda_icon,
                                title: 'TimeTable'),
                            HomeOptionSelect(
                                onPress: null,
                                icon: event_icon,
                                title: 'Event'),
                          ],
                        ),
                        SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: null,
                                icon: resume_icon,
                                title: 'Resume'),
                            HomeOptionSelect(
                                onPress: null,
                                icon: result_icon,
                                title: 'Result'),
                          ],
                        ),
                        SizeBoxOpt(high: kDefaultPadding / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeOptionSelect(
                                onPress: null,
                                icon: setting_icon,
                                title: 'Setting'),
                            HomeOptionSelect(
                                onPress: null,
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
