import 'package:flutter/material.dart';
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
                        Row(
                          children: [
                            Text(
                              "Hi ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                            Text(
                              Student.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Text('CLass: $Student.classname',
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: kTextWhiteColor,
                                fontWeight: FontWeight.w200)),
                        const SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            color: kOtherColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding),
                          ),
                          alignment: Alignment.center,
                          child: const Text('2023 - 2024',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  color: kTextBlackColor)),
                        )
                      ]),
                  const SizedBox(
                    height: kDefaultPadding / 4,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/profile'), // go to profile edit screen
                    child: const CircleAvatar(
                      minRadius: 50.0,
                      maxRadius: 50.0,
                      backgroundColor: kSecondaryColor,
                      backgroundImage: AssetImage(student_img),
                    ),
                  ),
                ],
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {/*go to atendance screen*/},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                      ),
                      alignment: Alignment.topCenter,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Attendance',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: kTextBlackColor),
                            ),
                            Text(
                              '100%',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30,
                                      color: kTextBlackColor),
                            ),
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: () {/*go to atendance screen*/},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                      ),
                      alignment: Alignment.topCenter,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Avarege Score',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: kTextBlackColor),
                            ),
                            Text(
                              '10.0 / 10.0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30,
                                      color: kTextBlackColor),
                            ),
                          ]),
                    ),
                  )
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
                )),
          )
        ],
      ),
    );
  }
}
