import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Component/result_component.dart';
import 'package:hedspi_learningapp/Result/result_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  static String routeName = '/resultScreen';

  @override
  Widget build(BuildContext context) {
    double result = SumScore(resultList);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Results',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                margin: const EdgeInsets.all(kDefaultPadding),
                child: CustomPaint(
                  foregroundPainter: CircularPainter(
                      backgroundColor: Colors.white,
                      lineColor: getGradeColor(double.parse(
                              (result / (resultList.length * 10))
                                  .toStringAsFixed(2)) *
                          10),
                      width: 30,
                      percent: result / (resultList.length * 10)),
                  child: Center(
                    child: Text('$result\n/\n${resultList.length * 10}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kTextWhiteColor, fontSize: 25)),
                  ),
                ),
              ),
            ),
            Text(
              'You are so ${getGrade(Student.averageScore)}!!',
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
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            sizedBox,
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: kOtherColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding),
                        topRight: Radius.circular(kDefaultPadding))),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(kDefaultPadding),
                  itemCount: resultList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          boxShadow: const [
                            BoxShadow(
                              color: kTextLightColor,
                              //spreadRadius: 1,
                              blurRadius: 2,
                              //offset: Offset(0, 1)
                            )
                          ],
                          borderRadius: BorderRadius.circular(kDefaultPadding)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              resultList[index].subjectName,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: kTextWhiteColor),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${resultList[index].totalScore}/10',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: kTextWhiteColor),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding))),
                                    ),
                                    Container(
                                      width: resultList[index].totalScore * 10,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: getGradeColor(
                                              resultList[index].totalScore),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding))),
                                    )
                                  ],
                                ),
                                Text(
                                  getGrade(resultList[index].totalScore),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ],
                        )
                      ]),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}

String getGrade(double score) {
  if (score >= 9) {
    return 'Excelent';
  } else if (score >= 8) {
    return 'Very Good';
  } else if (score >= 7) {
    return 'Good';
  } else if (score >= 5) {
    return 'Graded fairly';
  } else {
    return 'Bad';
  }
}

Color getGradeColor(double score) {
  if (score >= 9) {
    return Colors.green;
  } else if (score >= 8) {
    return Colors.lightGreen;
  } else if (score >= 7) {
    return Colors.yellow;
  } else if (score >= 5) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
