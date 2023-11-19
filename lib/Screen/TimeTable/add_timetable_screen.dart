// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/timetable_data.dart';

TextEditingController _subjectnameController = TextEditingController();
TextEditingController _roomController = TextEditingController();
TextEditingController _timeBeginController = TextEditingController();
TextEditingController _timeEndController = TextEditingController();

class AddTimetableScreen extends StatefulWidget {
  const AddTimetableScreen({super.key});

  static const String routeName = "/addResult";

  @override
  State<AddTimetableScreen> createState() => _AddTimetableScreenState();
}

class _AddTimetableScreenState extends State<AddTimetableScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Edit Timetable',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 2),
                  decoration: const BoxDecoration(
                      color: kOtherColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kDefaultPadding),
                          topRight: Radius.circular(kDefaultPadding))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormFill(
                            title: 'Subject Name',
                            controller: _subjectnameController),
                        sizedBox,
                        FormFill(title: 'Room', controller: _roomController),
                        sizedBox,
                        const FormFillDay(title: 'Day'),
                        sizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(width: kDefaultPadding),
                            FormFillTime(
                                title: 'Time Begin',
                                controller: _timeBeginController),
                            const SizedBox(width: kDefaultPadding),
                            FormFillTime(
                                title: 'Time End',
                                controller: _timeEndController),
                            const SizedBox(width: kDefaultPadding),
                          ],
                        ),
                        const SizeBoxOpt(high: kDefaultPadding * 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pop(context, [
              _subjectnameController.text,
              _roomController.text,
              selectedDay,
              _timeBeginController.text,
              _timeEndController.text,
            ]);
          }
        },
        elevation: 10,
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.save_as_outlined),
      ),
    );
  }
}

class FormFill extends StatelessWidget {
  FormFill({super.key, required this.title, required this.controller});

  final String title;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          color: kOtherColor,
          boxShadow: const [
            BoxShadow(
              color: kTextLightColor,
              blurRadius: 2,
              // changes position of shadow
            ),
          ]),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
        ),
        validator: (value) {
          //FORM VALIDATION
          if (value == null || value.isEmpty) {
            return 'Please enter your $title';
            //if dose not match the regex pattern
          }
          return null;
        },
      ),
    );
  }
}

String selectedDay = Weekday.monday;

class FormFillDay extends StatefulWidget {
  const FormFillDay({super.key, required this.title});

  final String title;

  @override
  State<FormFillDay> createState() => _FormFillDayState();
}

class _FormFillDayState extends State<FormFillDay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: kOtherColor,
        boxShadow: const [
          BoxShadow(
            color: kTextLightColor,
            blurRadius: 2,
            // changes position of shadow
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        items: <String>[
          Weekday.monday,
          Weekday.tuesday,
          Weekday.wednesday,
          Weekday.thursday,
          Weekday.friday,
          Weekday.saturday,
          Weekday.sunday
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: selectedDay, // Set the initial value to null
        onChanged: (String? value) {
          setState(() {
            if (value != null) {
              selectedDay = value;
            } // Update the selectedDay when the value changes
          });
        },
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: const TextStyle(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
        ),
        validator: (value) {
          //FORM VALIDATION
          if (value == null || value.isEmpty) {
            return 'Please select an option for ${widget.title}';
          }
          return null;
        },
      ),
    );
  }
}

class FormFillTime extends StatelessWidget {
  FormFillTime({super.key, required this.title, required this.controller});

  final String title;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultPadding),
            color: kOtherColor,
            boxShadow: const [
              BoxShadow(
                color: kTextLightColor,
                blurRadius: 2,
                // changes position of shadow
              ),
            ]),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.start,
          style: const TextStyle(
              color: kTextBlackColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w300),
          decoration: InputDecoration(
            labelText: title,
            labelStyle: const TextStyle(fontSize: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());

            TimeOfDay? time = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());

            if (time != null) {
              controller.text = TimeTableData.timeOfDayToString(time);
            }
          },
          validator: (value) {
            //FORM VALIDATION
            if (value == null || value.isEmpty) {
              return 'Please enter your $title';
              //if dose not match the regex pattern
            }
            return null;
          },
        ),
      ),
    );
  }
}
