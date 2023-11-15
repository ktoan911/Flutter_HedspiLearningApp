// ignore_for_file: file_names

class AssignmetData {
  late final String subjectName;
  late final String topicName;
  late final String assignmentDate;
  late final String deadLine;
  late final String note;
  bool isSubmitted;
  AssignmetData(this.subjectName, this.topicName, this.assignmentDate,
      this.deadLine, this.note, this.isSubmitted);
}

List<AssignmetData> assignList = [
  AssignmetData('C Basic', 'String Contest', '10/10/2023', '12/10/2023',
      'Submit at HustStack', false),
  AssignmetData('C Basic', 'String Contest', '10/10/2023', '12/10/2023',
      'Submit at HustStack', false),
  AssignmetData('C Basic', 'String Contest', '10/10/2023', '12/10/2023',
      'Submit at HustStack', false),
  AssignmetData('C Basic', 'String Contest', '10/10/2023', '12/10/2023',
      'Submit at HustStack', false),
  AssignmetData('C Basic', 'String Contest', '10/10/2023', '12/10/2023',
      'Submit at HustStack', false),
];

class Student {
  static String name = '';
  static String classes = '';
  static String birth = '';
  static int numOutCourse = 0;
  static double averageScore = 9.8;
  static String regisNum = '2022-HUST-2609';
  static String studyYear = '';

  // ignore: non_constant_identifier_names
  static String student_img = 'assets/images/student.png';
  static String email = '';
  static String phonenumber = '';
  static String studentID = '';
  static String hometown = '';
  static String uid = '';
  static String password = '';

  static void setEmailPassword(String email, String password) {
    Student.email = email;
    Student.password = password;
  }
}

String errorLogin = '';
