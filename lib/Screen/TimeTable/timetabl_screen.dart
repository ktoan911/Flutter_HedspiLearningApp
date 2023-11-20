import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Firebase/FirebaseFunc.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/ProfileData.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/add_timetable_screen.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/timetable_data.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  static const String routeName = "/timetable";

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  void deleteTimetbale(int index) {
    setState(() {
      TimeTableData sub = timeTableList[index];
      deleteTimetableFromFirebaseByTimetabletId(sub.id);
      timeTableList.remove(sub);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Timetable',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const AddTimetableScreen(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      String temp = DateTime.now().toIso8601String();
                      addUserTimetable(temp, result[0], result[1], result[2],
                          result[3], result[4], Student.uid);
                      timeTableList.add(
                        TimeTableData(
                            subject: result[0],
                            room: result[1],
                            day: result[2],
                            timeBegin:
                                TimeTableData.stringToTimeOfDay(result[3]),
                            timeEnd: TimeTableData.stringToTimeOfDay(result[4]),
                            id: temp),
                      );
                      sortTimetbaleList();
                    });
                  }
                },
                child: Row(children: [
                  const Icon(Icons.add_circle),
                  const SizedBox(
                    width: kDefaultPadding / 5,
                  ),
                  Text(
                    'Add',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: kDefaultPadding / 3,
                  ),
                ]),
              )
            ]),
        body: Column(children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding),
                    topRight: Radius.circular(kDefaultPadding))),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: timeTableList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () async {
                      final result = await popupCheckDelete(context);
                      if (result != null && result) {
                        deleteTimetbale(index);
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding / 2,
                            right: kDefaultPadding / 2),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: kDefaultPadding,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          timeTableList[index].day,
                                          style: const TextStyle(
                                              color: kTextBlackColor,
                                              fontSize: 26.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${TimeTableData.timeOfDayToString(timeTableList[index].timeBegin)}\n${TimeTableData.timeOfDayToString(timeTableList[index].timeEnd)}',
                                          style: const TextStyle(
                                              color: kTextBlackColor,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    timeTableList[index].subject,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: kTextBlackColor),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.room_outlined),
                                            Text(
                                              timeTableList[index].room,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kTextBlackColor,
                                                      fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          ))
        ]));
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
                    'Are you sure that you want to delete this subject?',
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
