import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/TimeTable/timetable_data.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  static const String routeName = "/timetable";

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
        ),
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
                itemCount: timeTable.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding / 2,
                          right: kDefaultPadding / 2),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: kDefaultPadding,
                            child: Divider(
                              thickness: 1.0,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    timeTable[index].date.toString(),
                                    style: const TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  sizedBox,
                                  Text(
                                    timeTable[index].time,
                                    style: const TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Text(
                                timeTable[index].subject,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: kTextBlackColor),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      timeTable[index].room,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: kTextBlackColor,
                                              fontSize: 12.0),
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding,
                                      child: Divider(
                                        thickness: 1.0,
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ],
                      ));
                }),
          ))
        ]));
  }
}
