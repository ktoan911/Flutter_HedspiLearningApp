// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:intl/intl.dart';

TextEditingController _subjectnameController = TextEditingController();
TextEditingController _topicnameController = TextEditingController();
TextEditingController _noteAssignmentController = TextEditingController();
TextEditingController _deadlineController = TextEditingController();

DateTime _deadline = DateTime.now();

class AddAssignmentScreen extends StatefulWidget {
  const AddAssignmentScreen({super.key});

  static const String routeName = "/addResult";

  @override
  State<AddAssignmentScreen> createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // if (widget.resultData != null) {
    //   _subjectnameController =
    //       TextEditingController(text: widget.resultData!.subjectName);
    //   _topicnameController =
    //       TextEditingController(text: widget.resultData!.totalScore.toString());
    //   _deadlineController = TextEditingController(
    //       text: widget.resultData!.numbercredit.toString());
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Add Result',
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
                        FormFill(
                            title: 'Topic Name',
                            controller: _topicnameController),
                        sizedBox,
                        FormFill(
                            title: 'Note',
                            controller: _noteAssignmentController),
                        sizedBox,
                        FormFillDate(
                            controller: _deadlineController, title: "Deadline"),
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
              _topicnameController.text,
              _deadline.toIso8601String(),
              _noteAssignmentController.text,
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

class FormFillDate extends StatelessWidget {
  FormFillDate({super.key, required this.title, required this.controller});

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
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());

          DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010),
              lastDate: DateTime(2050));

          if (date != null) {
            controller.text = DateFormat('MM/ dd / yyyy').format(date);
            _deadline = date;
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
    );
  }
}
