import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/my_font.dart';
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
    var bodySurvey;
    switch (sm.metricNo) {
      case "1":
        bodySurvey = Survey1();
        break;
      case "2":
        bodySurvey = Survey2();
        break;
      case "3":
        bodySurvey = Survey3();
        break;
      case "4":
        bodySurvey = Survey4();
        break;
      case "5":
        bodySurvey = Survey5();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("แบบสอบถาม"),
      ),
      body: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bgimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                  color: MyFont.colorBG,
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(30.0))),
              child: bodySurvey)),
    );
  }
}
