import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber2.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey32 extends StatefulWidget {
  @override
  _Survey32State createState() => _Survey32State();
}

class _Survey32State extends State<Survey32> {
  Home home;

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
              '32. กองทุนพัฒนาบทบาทสตรี',
              style: MyFont.h1Font,
            ),
          ),
          ListTile(
            title: Text(
              '32.1 ครัวเรือนนี้มีสตรีที่เป็นสมาชิกกองทุนพัฒนาบทบาทสตรี',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioInputNumber(
            label: 'มี ... คน',
            value: "1",
            groupValue: home.answer["63211"],
            question: "63211",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["63211"] = value;
              });
            },
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["63211"],
            onChanged: (String value) {
              setState(() {
                home.answer["63211"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '32.2 ครัวเรือนนี้มีสตรีทีได้รับเงินทุนหมุนเวียนของกองทุนพัฒนาบทบาทสตรี',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioInputNumber2(
            label: 'มี ... คน จำนวน ... บาท',
            value: "1",
            groupValue: home.answer["63221"],
            question: "จำนวน",
            unit: "คน",
            unit2: "บาท",
            onChanged: (String value) {
              setState(() {
                home.answer["63221"] = value;
              });
            },
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["63221"],
            onChanged: (String value) {
              setState(() {
                home.answer["63221"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '32.3 ครัวเรือนนี้มีสตรีทีได้เข้าร่วมกิจกรรมของกองทุนพัฒนาบทบาทสตรี',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioInputNumber(
            label: 'มี ... คน',
            value: "1",
            groupValue: home.answer["63231"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["63231"] = value;
              });
            },
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["63231"],
            onChanged: (String value) {
              setState(() {
                home.answer["63231"] = value;
              });
            },
          ),
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
                      .popAndPushNamed("/survey", arguments: 31);
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
                      .popAndPushNamed("/survey", arguments: 32);
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
