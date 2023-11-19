// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Screen/Assignment_Screen/assignment_data.dart';
import 'package:hedspi_learningapp/Screen/Note/note_data.dart';
import 'package:hedspi_learningapp/Screen/Result/result_data.dart';
import 'package:hedspi_learningapp/Screen/Student_Profile/ProfileData.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/timetable_data.dart';

bool isLoadDataFromFirebase = false;

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

Future addUserNote(
  String id,
  String datetime,
  String title,
  String content,
  String uid,
) async {
  await FirebaseFirestore.instance
      .collection(FirebaseStringConst.NoteCollection)
      .add({
    'id': id,
    'datetime': datetime,
    'title': title,
    'content': content,
    'uid': uid,
  });
}

Future addUserTimetable(
  String id,
  String subject,
  String room,
  String day,
  String timebegin,
  String timeend,
  String uid,
) async {
  await FirebaseFirestore.instance
      .collection(FirebaseStringConst.TimetableCollection)
      .add({
    'id': id,
    'subject': subject,
    'room': room,
    'day': day,
    'timebegin': timebegin,
    'timeend': timeend,
    'uid': uid,
  });
}

Future addUserAssignment(
  String subjectname,
  String topicname,
  DateTime deadline,
  String note,
  bool isdone,
  String assignmentID,
  String uid,
) async {
  await FirebaseFirestore.instance
      .collection(FirebaseStringConst.AssignmentCollection)
      .add({
    'subjectname': subjectname,
    'topicname': topicname,
    'deadline': deadline.toIso8601String(),
    'note': note,
    'isdone': isdone ? 1 : 0,
    'id': assignmentID,
    'uid': uid,
  });
}

Future addUserResult(String numbercredit, String subjectname, String totalscore,
    String uid, String resultID) async {
  await FirebaseFirestore.instance
      .collection(FirebaseStringConst.ResultCollection)
      .add({
    'numbercredit': numbercredit,
    'subjectname': subjectname,
    'totalscore': totalscore,
    'uid': uid,
    'resultid': resultID,
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
    print("Lỗi khi tìm kiếm dữ liệu data: $e");
  }
}

Future<void> getNoteFromFirebaseByUid(String uid) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.NoteCollection)
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      noteList.clear();
      // Dữ liệu được tìm thấy
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        // Truy cập dữ liệu từ mỗi tài liệu
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        noteList.add(Note(
          id: data['id'],
          title: data['title'],
          content: data['content'],
          modifiedTime: DateTime.parse(data['datetime']),
        ));
      }
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $uid");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu note : $e");
  }
}

Future<void> deleteNoteFromFirebaseByNoteId(String noteID) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.NoteCollection)
        .where('id', isEqualTo: noteID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.delete();
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $noteID");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu note: $e");
  }
}

Future<void> updateNoteFromFirebaseByUid(
    String noteid, String datetime, String title, String newNote) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.NoteCollection)
        .where('id', isEqualTo: noteid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.update({
        'datetime': datetime,
        'title': title,
        'content': newNote,
      });
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với noteid $noteid");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu note : $e");
  }
}

Future<void> updateAssignmentFromFirebaseByUid(String id, bool isdone) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.AssignmentCollection)
        .where('id', isEqualTo: id)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.update({
        'isdone': isdone ? 1 : 0,
      });
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với assignid $id");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu assignment : $e");
  }
}

Future<void> deleteResultFromFirebaseByResultId(String resultID) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.ResultCollection)
        .where('resultid', isEqualTo: resultID)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.delete();
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $resultID");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu result: $e");
  }
}

Future<void> getResultFromUid(String uid) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.ResultCollection)
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      resultList.clear();
      // Dữ liệu được tìm thấy
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        // Truy cập dữ liệu từ mỗi tài liệu
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        double tmp = 0;
        int temp = 0;
        if (double.tryParse(data['totalscore']) != null) {
          tmp = double.parse(data['totalscore']);
        }
        if (int.tryParse(data['numbercredit']) != null) {
          temp = int.parse(data['numbercredit']);
        }

        resultList
            .add(ResultData(data['subjectname'], tmp, temp, data['resultid']));
      }
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $uid");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu result: $e");
  }
}

Future<void> getTimetableFromUid(String uid) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.TimetableCollection)
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      timeTableList.clear();
      // Dữ liệu được tìm thấy
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        // Truy cập dữ liệu từ mỗi tài liệu
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        timeTableList.add(TimeTableData(
            subject: data['subject'],
            room: data['room'],
            day: data['day'],
            timeBegin: TimeTableData.stringToTimeOfDay(data['timebegin']),
            timeEnd: TimeTableData.stringToTimeOfDay(data['timeend']),
            id: data['id']));
      }
      sortTimetbaleList();
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $uid");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu timetbale: $e");
  }
}

Future<void> getAssignmentFromUid(String uid) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FirebaseStringConst.AssignmentCollection)
        .where('uid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      assignList.clear();
      // Dữ liệu được tìm thấy
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        // Truy cập dữ liệu từ mỗi tài liệu
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        DateTime tmp = DateTime.now();

        if (DateTime.tryParse(data['deadline']) != null) {
          tmp = DateTime.parse(data['deadline']);
        }

        bool temp = (data['isdone'] == 1 ? true : false);

        assignList.add(AssignmetData(data['subjectname'], data['topicname'],
            tmp, data['note'], temp, data['id']));
      }
      sortAssignmentList();
    } else {
      // Không tìm thấy dữ liệu
      print("Không tìm thấy dữ liệu với uid $uid");
    }
  } catch (e) {
    print("Lỗi khi tìm kiếm dữ liệu assignment: $e");
  }
}

Future<void> initialLoadHomePage(String uid) async {
  await setDataFirebaseByUid(uid);
  await getResultFromUid(uid);
  await getNoteFromFirebaseByUid(uid);
  await getAssignmentFromUid(uid);
  await getTimetableFromUid(uid);
  isLoadDataFromFirebase = true;
}
