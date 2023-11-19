// ignore_for_file: file_names
class Student {
  static String name = '';
  static String classes = '';
  static String birth = '';
  static int numOutCourse = 0;
  static double averageScore = 9.8;
  static String regisNum = '2022-HUST-2609';
  static String studyYear = '';
  static int numberAssignment = 0;

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
