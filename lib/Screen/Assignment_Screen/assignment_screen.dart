import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/constant.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  static String routeName = '/assignment_screen ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Assignments',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kTextWhiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 20)),
          centerTitle: true,
        ),
        body: Column(
          children: [
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
                  itemCount: assignList.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultPadding),
                                  color: kOtherColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: kTextLightColor,
                                      blurRadius: 2,
                                      // changes position of shadow
                                    ),
                                  ]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                            color: kSecondaryColor
                                                .withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(
                                                kDefaultPadding)),
                                        child: Center(
                                          child: Text(
                                            assignList[index].subjectName,
                                            style: const TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400,
                                                color: kPrimaryColor),
                                          ),
                                        )),
                                    const SizeBoxOpt(high: kDefaultPadding / 2),
                                    Text(
                                      assignList[index].topicName,
                                      style: const TextStyle(
                                          color: kTextBlackColor,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizeBoxOpt(high: kDefaultPadding / 2),
                                    AssignDetail(
                                        title: 'Assignment Date:',
                                        data: assignList[index].assignmentDate),
                                    const SizeBoxOpt(high: kDefaultPadding / 2),
                                    AssignDetail(
                                        title: 'Deadline:',
                                        data: assignList[index].deadLine),
                                    const SizeBoxOpt(high: kDefaultPadding / 2),
                                    AssignDetail(
                                        title: 'Note:',
                                        data: assignList[index].note),
                                    const SizeBoxOpt(high: kDefaultPadding / 2),
                                    SubmitBtn(
                                        isSubmitted:
                                            assignList[index].isSubmitted,
                                        index: index,
                                        onPress: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                _buildPopupDialog(context,
                                                    index: index),
                                          );
                                        } // submit here,
                                        ),
                                  ]),
                            )
                          ]),
                    );

                    // ...
                  },
                ),
              ),
            )
          ],
        ));
  }
}

class SubmitBtn extends StatelessWidget {
  const SubmitBtn({
    super.key,
    required this.isSubmitted,
    required this.index,
    this.onPress,
  });

  final VoidCallback? onPress;
  final bool isSubmitted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSubmitted) {
          onPress!();
        } else {
          assignList[index].isSubmitted = false;
          Navigator.of(context).popAndPushNamed(AssignmentScreen.routeName);
        }
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSubmitted
                ? [Colors.grey, Colors.grey] // Màu xám khi đã submit
                : [kSecondaryColor, kPrimaryColor], // Màu chính
            begin: const FractionalOffset(0, 0),
            end: const FractionalOffset(0.5, 0),
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Center(
          child: Text(
            isSubmitted ? 'UnSubmitted' : 'Submit Assignment',
            style: const TextStyle(
              color: kTextWhiteColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class AssignDetail extends StatelessWidget {
  const AssignDetail({
    required this.title,
    required this.data,
    super.key,
  });
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: kTextLightColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
        ),
        Text(
          data,
          style: const TextStyle(
              color: kTextBlackColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context, {required int index}) {
  final textEditingController = TextEditingController();

  //bool isFilled = false;
  return AlertDialog(
    title: const Text('Submit Assignment'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Fill file submit here",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        sizedBox,
        TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
              hintText: 'Fill Here',
              hintStyle: TextStyle(color: kTextLightColor)),
        )
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            //textColor: Theme.of(context).primaryColor,
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              assignList[index].isSubmitted = !assignList[index].isSubmitted;
              Navigator.of(context).popAndPushNamed(
                  AssignmentScreen.routeName); // Reload lại trang
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            //textColor: Theme.of(context).primaryColor,
            child: const Text('Submit'),
          )
        ],
      ),
    ],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Điều chỉnh giá trị để bó góc
    ),
  );
}
