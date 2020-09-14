import 'package:flutter/material.dart';
import 'package:smartsurveys/survey/Survey1.dart';
import 'package:smartsurveys/survey/Survey2.dart';
import 'package:smartsurveys/survey/Survey3.dart';
import 'package:smartsurveys/survey/Survey4.dart';
import 'package:smartsurveys/survey/Survey5.dart';
import 'package:smartsurveys/survey/Survey6.dart';
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
    }

    return SurveyBody.build(
        context: context, title: "แบบสอบถาม", child: Container());
  }
}
