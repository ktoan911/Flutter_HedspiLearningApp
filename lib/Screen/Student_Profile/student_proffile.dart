import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});
  static String routeName = "/student_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kTextWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 20)),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              //send report
            },
            child: Row(children: [
              const Icon(Icons.report_gmailerrorred_outlined),
              const SizedBox(
                width: kDefaultPadding / 2,
              ),
              Text(
                'Report',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ]),
          )
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kDefaultPadding * 2),
                    bottomRight: Radius.circular(kDefaultPadding * 2)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(Student.student_img),
                      backgroundColor: kSecondaryColor,
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Column(
                      children: [
                        const SizeBoxOpt(high: kDefaultPadding * 3),
                        Text(
                          Student.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text('Class: ${Student.classes}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14)),
                      ],
                    )
                  ]),
            ),
            sizedBox,
            Row(children: [
              ProfileDetailShort(
                title: 'Registration Number',
                detail: Student.regisNum,
              ),
              ProfileDetailShort(
                title: 'Outstanding courses',
                detail: Student.numOutCourse.toString(),
              ),
            ]),
            Row(children: [
              ProfileDetailShort(
                title: 'Date of birth',
                detail: Student.birth,
              ),
              ProfileDetailShort(
                title: 'Phone Numer',
                detail: Student.phonenumber,
              ),
            ]),
            Row(children: [
              ProfileDetailShort(
                title: 'Student ID',
                detail: Student.studentID,
              ),
              const ProfileDetailShort(
                title: 'Academic Year',
                detail: '2023-2024',
              ),
            ]),
            sizedBox,
            ProfileDetailLong(
              title: 'Email',
              detail: Student.email,
            ),
            ProfileDetailLong(
              title: 'HomeTown',
              detail: Student.hometown,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailLong extends StatelessWidget {
  const ProfileDetailLong({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: kTextLightColor, fontSize: 15.0),
            ),
            const SizeBoxOpt(high: kDefaultPadding / 2),
            Text(
              detail,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kTextBlackColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: const Divider(
                //color: kTextLightColor,
                thickness: 1,
              ),
            )
          ],
        ),
        const Icon(
          Icons.lock_outline,
          size: 20,
        )
      ],
    );
  }
}

class ProfileDetailShort extends StatelessWidget {
  const ProfileDetailShort({
    super.key,
    required this.title,
    required this.detail,
  });

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: kDefaultPadding / 4,
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15, color: kTextLightColor),
                ),
                const SizeBoxOpt(high: kDefaultPadding / 2),
                Text(detail,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15,
                        color: kTextBlackColor,
                        fontWeight: FontWeight.w600)),
                //const SizeBoxOpt(high: kDefaultPadding / 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: const Divider(
                    //color: kTextLightColor,
                    thickness: 1,
                  ),
                )
              ],
            ),
            const Icon(
              Icons.lock_outline,
              size: 20,
            )
          ]),
    );
  }
}
