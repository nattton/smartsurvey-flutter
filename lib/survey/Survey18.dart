import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey18 extends StatefulWidget {
  @override
  _Survey18State createState() => _Survey18State();
}

class _Survey18State extends State<Survey18> {
  SurveyApp app;
  Home home;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '18. คนในครัวเรือนที่จบการศึกษาภาคบังคับ 9 ปี ที่ไม่ได้เรียนต่อและยังไม่มีงานทำ ได้รับการฝึกอบรมด้านอาชีพ',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '18.1 ครัวเรือนนี้ มีคนในครัวเรือนที่จบการศึกษาภาคบังคับ 9 ปี ที่ไม่ได้ เรียนต่อชั้น ม.4 หรือเทียบเท่า และ ยังไม่มีงานทำ หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioInputNumber(
            label: 'มี ... คน',
            value: "1",
            question: "จำนวน",
            unit: "คน",
            groupValue: home.answer["31811"],
            onChanged: (String value) {
              setState(() {
                home.answer["31811"] = value;
              });
            },
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 19)',
            value: "0",
            groupValue: home.answer["31811"],
            onChanged: (String value) {
              setState(() {
                home.answer["31811"] = value;
              });
            },
          ),
          Visibility(
              visible: home.answer["31811"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '18.2 คนในครัวเรือน ตามข้อ 18.1 ได้รับการฝึกอบรมด้านอาชีพทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับการฝึกอบรม ด้านอาชีพทุกคน (ข้ามไปข้อ 19)',
                    value: "1",
                    groupValue: home.answer["31821"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31821"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับการฝึกอบรมด้านอาชีพ ... คน',
                    value: "0",
                    groupValue: home.answer["31821"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31821"] = value;
                      });
                    },
                  ),
                  Visibility(
                    visible: home.answer["31821"] != "1",
                    child: Column(children: [
                      ListTile(
                        title: Text(
                            '18.3 คนในครัวเรือนที่ไม่ได้รับการฝึกอบรมด้านอาชีพ ตามข้อ 18.2 แบ่งเป็น',
                            style: MyFont.h2Font),
                      ),
                      LabeledCheckBoxInputNumber(
                        label: 'ผู้ที่จบ ม.3 ในรอบปี ที่ผ่านมา ... คน',
                        value: "1",
                        groupValue: home.answer["31831"],
                        question: "จำนวน",
                        unit: "คน",
                        onChanged: (String value) {
                          setState(() {
                            home.answer["31831"] = value;
                          });
                        },
                      ),
                      LabeledCheckBoxInputNumber(
                        label: 'ผู้ที่จบ ม.3 ในปีอื่น ๆ ... คน',
                        value: "1",
                        groupValue: home.answer["31832"],
                        question: "จำนวน",
                        unit: "คน",
                        onChanged: (String value) {
                          setState(() {
                            home.answer["31832"] = value;
                          });
                        },
                      ),
                      ListTile(
                        title: Text(
                            '18.4 คนในครัวเรือนที่ไม่ได้รับการฝึกอบรมด้านอาชีพ ตามข้อ 18.2 มีความต้องการฝึกอบรมด้านอาชีพ กี่คน',
                            style: MyFont.h2Font),
                      ),
                      LabeledCheckBoxInputNumber(
                        label: 'มี ... คน',
                        value: "1",
                        groupValue: home.answer["31841"],
                        question: "จำนวน",
                        unit: "คน",
                        onChanged: (String value) {
                          setState(() {
                            home.answer["31841"] = value;
                          });
                        },
                      ),
                    ]),
                  ),
                ],
              )),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              PillShapedButton(
                title: "ย้อนกลับ",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context)
                      .popAndPushNamed("/survey", arguments: 17);
                },
              ),
              SizedBox(width: 20.0),
              PillShapedButton(
                title: "ถัดไป",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context)
                      .popAndPushNamed("/survey", arguments: 19);
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
