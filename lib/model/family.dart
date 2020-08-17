import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

class Family {
  Family({this.community, this.answer});
  String community;
  HashMap<String, String> answer;


  String getAnswer(String key) {
    return answer[key];
  }

  String setAnswer(String key, String value) {
    return answer[key] = value;
  }
}

Future<String> getFamily() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String familyString = (prefs.getString('family'));
  print('familyString = $familyString');
  return familyString;
}

Future<String> setFamily(String familyString) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('family', familyString);
  return familyString;
}