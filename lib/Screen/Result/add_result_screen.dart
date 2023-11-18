// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Screen/Result/result_data.dart';

TextEditingController _subjectnameController = TextEditingController();
TextEditingController _totalscoreController = TextEditingController();
TextEditingController _creditController = TextEditingController();

class AddResultScreen extends StatefulWidget {
  AddResultScreen({super.key, this.resultData});

  static const String routeName = "/addResult";
  ResultData? resultData;

  @override
  State<AddResultScreen> createState() => _AddResultScreenState();
}

class _AddResultScreenState extends State<AddResultScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.resultData != null) {
      _subjectnameController =
          TextEditingController(text: widget.resultData!.subjectName);
      _totalscoreController =
          TextEditingController(text: widget.resultData!.totalScore.toString());
      _creditController = TextEditingController(
          text: widget.resultData!.numbercredit.toString());
    }
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
                        ProfileFill(
                            title: 'Subject Name',
                            controller: _subjectnameController),
                        sizedBox,
                        ProfileFillNumDouble(
                            title: 'Total Score',
                            controller: _totalscoreController),
                        sizedBox,
                        ProfileFillNumInt(
                            title: 'Number of Credits',
                            controller: _creditController),
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
              _totalscoreController.text,
              _creditController.text,
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

class ProfileFill extends StatelessWidget {
  ProfileFill({super.key, required this.title, required this.controller});

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
        keyboardType: TextInputType.emailAddress,
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

class ProfileFillNumDouble extends StatelessWidget {
  ProfileFillNumDouble(
      {super.key, required this.title, required this.controller});

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
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 17.0,
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
          double? tempVal = double.tryParse(value);
          if (tempVal == null || tempVal > 10 || tempVal < 0) {
            return 'Please enter a valid number for $title';
          }
          return null;
        },
      ),
    );
  }
}

class ProfileFillNumInt extends StatelessWidget {
  ProfileFillNumInt({super.key, required this.title, required this.controller});

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
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
            color: kTextBlackColor,
            fontSize: 17.0,
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

          if (int.tryParse(value) == null) {
            return 'Please enter a valid number for $title';
          }
          return null;
        },
      ),
    );
  }
}
