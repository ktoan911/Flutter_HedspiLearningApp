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
  static String name = 'Nguyen Khanh Toan';
  static String classes = 'J6';
  static String birth = '20/10/2004';
  static int numOutCourse = 0;
  static double averageScore = 9.8;
  static String regisNum = '2022-HUST-2609';
  // ignore: non_constant_identifier_names
  static String student_img = 'assets/images/student.png';
  static String email = 'abc@gmai.com';
  static String phonenumber = '090xxxxxxx';
  static String studentID = '202260xxx';
  static String hometown = 'Ha Noi';
  static String fatherName = 'Nguyen Van A';
  static String motherName = 'Nguyen Thi B';
}
