import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Component/custom_btn.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/ProfileData.dart';
import 'package:flutter/cupertino.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ScholarshipScreen extends StatefulWidget {
  const ScholarshipScreen({super.key});

  static const String routeName = "/sholarship_screen";

  @override
  State<ScholarshipScreen> createState() => _ScholarshipScreenState();
}

int index_picker = 0;
int ans = 3;

class _ScholarshipScreenState extends State<ScholarshipScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load TensorFlow Lite model on app start
    loadModel();
    ans = 3;
  }

  Future<void> loadModel() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var interpreterOptions = InterpreterOptions()..threads = 4;
      final interpreter = await Interpreter.fromAsset('assets/model.tflite',
          options: interpreterOptions);
      setState(() {
        _isLoading = false;
        print("Model loaded successfully");
      });
    } catch (e) {
      print('Error loading model: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void predict() {
    List<double> features = [
      double.parse(Student.schoolYear),
      Student.averageScore / 4.0,
      double.parse(Student.trainingPoint) / 100.0,
      double.parse(Student.semester)
    ];
    for (int i = 0; i < 55; i++) {
      if (i == index_picker) {
        features.add(1.0);
      } else {
        features.add(0.0);
      }
    }
    classifyFeatures(features);
  }

  Future<void> classifyFeatures(List<double> features) async {
    try {
      var interpreterOptions = InterpreterOptions()..threads = 4;
      final interpreter = await Interpreter.fromAsset('assets/model.tflite',
          options: interpreterOptions);

      var input = Float64List.fromList(features);
      var output = List<double>.filled(1 * 4, 1);

      var outputs =
          List.filled(1, output); // Tạo danh sách 2 chiều với 1 hàng và 4 cột

      // Run inference
      interpreter.run(input, outputs);

      setState(() {
        List<double> flattenedOutputs = outputs.expand((list) => list).toList();
        double max = -1;
        for (int i = 0; i < flattenedOutputs.length; i++) {
          if (flattenedOutputs[i] > max) {
            max = flattenedOutputs[i];
            ans = i;
          }
        }
        print(outputs);
        _isLoading = false;
      });

      interpreter.close();
    } catch (e) {
      print('Error classifying features: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Scholarship Prediction',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.8),
                        borderRadius:
                            BorderRadius.circular(kDefaultPadding / 2)),
                    child: const Icon(Icons.settings, color: kTextWhiteColor),
                  ),
                )
              ],
            ),
            body: Column(children: [
              Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kDefaultPadding),
                              topRight: Radius.circular(kDefaultPadding))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kDefaultPadding * 3 / 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              BoxHighLight(
                                onPress: () {
                                  // Navigator.pushNamed(
                                  //     context, ResultScreen.routeName);
                                },
                                title: 'GPA',
                                data: '${Student.averageScore} ',
                                colorHighlight: kPrimaryColor,
                                colorText: kOtherColor,
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'Please fill in the information below',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kTextBlackColor),
                          ),
                          const SizedBox(height: 10),
                          cuper_btn(context, titleMajor, majors),
                          const SizedBox(height: 10),
                          cuper_btn(context, titleSemester, Semester),
                          const SizedBox(height: 10),
                          cuper_btn(context, titleTrainingPoint, TrainingPoint),
                          const SizedBox(height: 10),
                          cuper_btn(context, titleSchoolYear, ki_hoc),
                          const SizedBox(height: 10),
                          Text(
                            Muc_hb(ans),
                            style: const TextStyle(color: kTextBlackColor),
                          ),
                          const SizedBox(height: 10),
                          DefaultBtn(
                              onPress: () {
                                predict();
                              },
                              title: 'Predict',
                              icon: Icons.batch_prediction)
                        ],
                      )))
            ])));
  }

  String titleMajor = 'Major';
  String titleSemester = 'Semester';
  String titleTrainingPoint = 'Training Point';
  String titleSchoolYear = 'School Year';
  // ignore: non_constant_identifier_names
  CupertinoButton cuper_btn(
      BuildContext context, String title, List<String> data) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(
          vertical: 20, horizontal: 100), // Đặt kích thước nút
      color: kPrimaryColor, // Đặt màu cho nút
      child: Text(title),
      onPressed: () => showCupertinoModalPopup(
        context: context,
        builder: (_) => SizedBox(
          width: double.infinity,
          height: 250,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 0),
            children: data.map((major) => Text(major)).toList(),
            onSelectedItemChanged: (value) {
              setState(() {
                if (majors == data) {
                  Student.major = data[value];
                  titleMajor = majors[value];
                  index_picker = value;
                } else if (Semester == data) {
                  Student.semester = data[value];
                  titleSemester = Semester[value];
                } else if (TrainingPoint == data) {
                  Student.trainingPoint = data[value];
                  titleTrainingPoint = TrainingPoint[value];
                } else if (ki_hoc == data) {
                  Student.schoolYear = data[value];
                  titleSchoolYear = ki_hoc[value];
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BoxHighLight extends StatelessWidget {
  BoxHighLight(
      {Key? key,
      this.onPress,
      required this.title,
      required this.data,
      this.colorHighlight = kOtherColor,
      this.colorText = kTextBlackColor})
      : super(key: key);

  final VoidCallback? onPress;
  final String title;
  final String data;
  Color colorHighlight;
  Color colorText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
          color: colorHighlight,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        alignment: Alignment.topCenter,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w800, fontSize: 15, color: colorText),
          ),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300, fontSize: 30, color: colorText),
          ),
        ]),
      ),
    );
  }
}

String Muc_hb(int prediction) {
  switch (prediction) {
    case 0:
      return "A Scholarship";
    case 1:
      return "B Scholarship";
    case 2:
      return "C Scholarship";
    default:
      return "Wish you luck next time";
  }
}
