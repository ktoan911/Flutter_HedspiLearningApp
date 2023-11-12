// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

Future addUserDetail(
    String name,
    String birth,
    String Class,
    String hometown,
    String phonenumber,
    String studentID,
    String studentImgLink,
    String studyYear,
    String uid,
    String email) async {
  await FirebaseFirestore.instance
      .collection(FirebaseStringConst.ProfileCollection)
      .add({
    'name': name,
    'birth': birth,
    'class': Class,
    'hometown': hometown,
    'phonenumber': phonenumber,
    'studentID': studentID,
    'uid': uid,
    'email': email,
    'studyYear': studyYear,
  });
}

Future<void> setDataFirebaseByUid(String uid) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.ProfileCollection)
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Dữ liệu được tìm thấy
      Map<String, dynamic> userData =
          querySnapshot.docs.first.data() as Map<String, dynamic>;
      Student.name = userData['name'];
      Student.birth = userData['birth'];
      Student.classes = userData['class'];
      Student.hometown = userData['hometown'];
      Student.phonenumber = userData['phonenumber'];
      Student.studentID = userData['studentID'];
      Student.studyYear = userData['studyYear'];
      Student.email = userData['email'];
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $uid");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu: $e");
  }
}
