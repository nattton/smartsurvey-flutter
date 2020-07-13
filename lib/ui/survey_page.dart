import 'package:flutter/material.dart';
import 'package:smartsurveys/model/surveymetric.dart';
import 'package:smartsurveys/survey/survey1.dart';
import 'package:smartsurveys/survey/survey2.dart';
import 'package:smartsurveys/survey/survey3.dart';
import 'package:smartsurveys/survey/survey4.dart';
import 'package:smartsurveys/survey/survey5.dart';

class SurveyPage extends StatefulWidget {
  static String routeName = 'survey';

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    final SurveyMetric sm = ModalRoute.of(context).settings.arguments;
    var body;
    switch(sm.metricNo) {
      case "1": body = Survey1();
      break;
      case "2": body = Survey2();
      break;
      case "3": body = Survey3();
      break;
      case "4": body = Survey4();
      break;
      case "5": body = Survey5();
      break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("แบบสอบถาม"),
      ),
      body: body,
    );
  }
}
