import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Screen/Assignment_Screen/assignment_data.dart';
import 'package:hedspi_learningapp/Screen/Note/note_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hedspi_learningapp/Screen/Result/result_data.dart';
import 'package:hedspi_learningapp/Screen/TimeTable/timetable_data.dart';
class SecureStorage {
  static checkIsLogin(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DataSave.isLoginSave = prefs.getBool(key) ?? false;
    if (DataSave.isLoginSave) {
      DataSave.emailSave = prefs.getString(DataSave.emailKey) ?? '';
      DataSave.passwordSave = prefs.getString(DataSave.passwordKey) ?? '';
    }
  }

  static writeString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static writeBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static delete(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('counter');
    return null;
  }
}

void setDataLoginCurrent(bool isLogin, String email, String password) async {
  await SecureStorage.writeBool(DataSave.isLoginKey, isLogin);
  await SecureStorage.writeString(DataSave.emailKey, email);
  await SecureStorage.writeString(DataSave.passwordKey, password);
}

void clearLocalData() async {
  resultList = [];
  timeTableList = [];
  assignList = [];
  noteList = [];
}
