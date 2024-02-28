// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/student_proffile.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

class StudentName extends StatelessWidget {
  const StudentName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Hi ",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w300),
        ),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class StudentInfo extends StatelessWidget {
  const StudentInfo({
    required this.classgrade,
    super.key,
  });

  final String classgrade;

  @override
  Widget build(BuildContext context) {
    return Text('Class: $classgrade',
        style: const TextStyle(
            fontSize: 14.0,
            color: kTextWhiteColor,
            fontWeight: FontWeight.w200));
  }
}

class StudentYearLearning extends StatelessWidget {
  const StudentYearLearning({
    required this.year,
    super.key,
  });

  final String year;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 20,
      decoration: BoxDecoration(
        color: kOtherColor,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      alignment: Alignment.center,
      child: Text(year,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
              color: kTextBlackColor)),
    );
  }
}

class StudentPicture extends StatelessWidget {
  const StudentPicture({
    required this.studentimg,
    super.key,
  });
  final String studentimg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
          context, StudentProfile.routeName), // go to profile edit screen
      child: CircleAvatar(
        minRadius: 50.0,
        maxRadius: 50.0,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(studentimg),
      ),
    );
  }
}

// ignore: must_be_immutable
class HighLightInfo extends StatelessWidget {
  HighLightInfo(
      {Key? key,
      this.onPress,
      required this.title,
      required this.data,
      this.colorHighlight = kOtherColor,
      this.colorText = kTextBlackColor})
      : super(key: key);

  final VoidCallback? onPress;
  final String title;
  final String data;
  Color colorHighlight;
  Color colorText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
          color: colorHighlight,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        alignment: Alignment.topCenter,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w800, fontSize: 15, color: colorText),
          ),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300, fontSize: 30, color: colorText),
          ),
        ]),
      ),
    );
  }
}
