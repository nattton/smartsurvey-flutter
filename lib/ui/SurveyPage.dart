import 'package:flutter/material.dart';
import 'package:smartsurveys/survey/Survey1.dart';
import 'package:smartsurveys/survey/Survey10.dart';
import 'package:smartsurveys/survey/Survey11.dart';
import 'package:smartsurveys/survey/Survey12.dart';
import 'package:smartsurveys/survey/Survey13.dart';
import 'package:smartsurveys/survey/Survey14.dart';
import 'package:smartsurveys/survey/Survey15.dart';
import 'package:smartsurveys/survey/Survey2.dart';
import 'package:smartsurveys/survey/Survey3.dart';
import 'package:smartsurveys/survey/Survey4.dart';
import 'package:smartsurveys/survey/Survey5.dart';
import 'package:smartsurveys/survey/Survey6.dart';
import 'package:smartsurveys/survey/Survey7.dart';
import 'package:smartsurveys/survey/Survey8.dart';
import 'package:smartsurveys/survey/Survey9.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class SurveyPage extends StatefulWidget {
  final int metricID;
  SurveyPage({key, this.metricID}) : super(key: key);
  @override
  _SurveyPageState createState() => _SurveyPageState(metricID: metricID);
}

class _SurveyPageState extends State<SurveyPage> {
  final int metricID;
  _SurveyPageState({this.metricID});

  @override
  Widget build(BuildContext context) {
    switch (metricID) {
      case 1:
        return Survey1();
      case 2:
        return Survey2();
      case 3:
        return Survey3();
      case 4:
        return Survey4();
      case 5:
        return Survey5();
      case 6:
        return Survey6();
      case 7:
        return Survey7();
      case 8:
        return Survey8();
      case 9:
        return Survey9();
      case 10:
        return Survey10();
      case 11:
        return Survey11();
      case 12:
        return Survey12();
      case 13:
        return Survey13();
      case 14:
        return Survey14();
      case 15:
        return Survey15();
    }

    return SurveyBody.build(
        context: context, title: "แบบสอบถาม", child: Container());
  }
}
