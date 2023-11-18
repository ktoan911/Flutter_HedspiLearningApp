import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/ProfileData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Firebase/FirebaseFunc.dart';
import 'package:hedspi_learningapp/Screen/Result/result_component.dart';
import 'package:hedspi_learningapp/Screen/Result/add_result_screen.dart';
import 'package:hedspi_learningapp/Screen/Result/result_data.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  static String routeName = '/resultScreen';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  void deleteResult(int index) {
    setState(() {
      ResultData result = resultList[index];
      deleteResultFromFirebaseByResultId(result.resultID);
      resultList.remove(result);
    });
  }

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
              height: MediaQuery.of(context).size.height / 5,
              margin: const EdgeInsets.all(kDefaultPadding),
              child: CustomPaint(
                foregroundPainter: CircularPainter(
                    backgroundColor: Colors.white,
                    lineColor: getGradeColor(result),
                    width: 30,
                    percent: result / 4.0),
                child: Center(
                  child: Text('$result\n/4.0',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kTextWhiteColor, fontSize: 25)),
                ),
              ),
            ),
            Text(
              'You are so ${getGrade(result)}!!',
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
                    return GestureDetector(
                      onLongPress: () async {
                        final result = await popupCheckDelete(context);
                        if (result != null && result) {
                          deleteResult(index);
                        }
                      },
                      child: Container(
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
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        kDefaultPadding),
                                                    bottomRight:
                                                        Radius.circular(
                                                            kDefaultPadding))),
                                      ),
                                      Container(
                                        width:
                                            resultList[index].totalScore * 10,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: getGradeColor(
                                                resultList[index]
                                                        .totalScore /
                                                    10 *
                                                    4),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(
                                                            kDefaultPadding),
                                                    bottomRight:
                                                        Radius.circular(
                                                            kDefaultPadding))),
                                      )
                                    ],
                                  ),
                                  Text(
                                    getGrade(
                                        resultList[index].totalScore / 10 * 4),
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
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final ans = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AddResultScreen(),
              ),
            );

            if (ans != null) {
              setState(() {
                String resultCode = DateTime.now().toIso8601String();
                addUserResult(ans[2], ans[0], ans[1], Student.uid, resultCode);
                double tmp = 0;
                int temp = 0;
                if (double.tryParse(ans[1]) != null) {
                  tmp = double.parse(ans[1]);
                }
                if (int.tryParse(ans[2]) != null) {
                  temp = int.parse(ans[2]);
                }
                resultList.add(ResultData(ans[0], tmp, temp, resultCode));
              });
            }
          },
          backgroundColor: kSecondaryColor.withOpacity(0.9),
          child: const Icon(Icons.add),
        ));
  }
}

String getGrade(double score) {
  if (score >= 3.6) {
    return 'Excelent';
  } else if (score >= 3.2) {
    return 'Very Good';
  } else if (score >= 2.5) {
    return 'Good';
  } else if (score >= 2.0) {
    return 'Graded fairly';
  } else if (score >= 1.5) {
    return 'Not good';
  } else if (score >= 1.0) {
    return 'Bad';
  } else {
    return 'Very Bad';
  }
}

Color getGradeColor(double score) {
  if (score >= 3.6) {
    return Colors.green;
  } else if (score >= 3.2) {
    return Colors.lightGreen;
  } else if (score >= 2.5) {
    return Colors.yellow;
  } else if (score >= 1.5) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

Future<dynamic> popupCheckDelete(BuildContext context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.info,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Are you sure that you want to delete this result?',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const SizedBox(
                          width: 60,
                          child: Text(
                            'No',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const SizedBox(
                          width: 60,
                          child: Text(
                            'Yes',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
      return pageChild;
    },
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}
