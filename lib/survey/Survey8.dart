import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey8 extends StatefulWidget {
  @override
  _Survey8State createState() => _Survey8State();
}

class _Survey8State extends State<Survey8> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);
    home = app.currentHome;

    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '8. ครัวเรือนมีความมั่นคงในที่อยู่อาศัยและบ้านมีสภาพคงทนถาวร',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '8.1 ครัวเรือนมีความมั่นคงในที่อยู่อาศัย หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["2811"],
            onChanged: (String value) {
              setState(() {
                home.answer["2811"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '8.2 ครัวเรือนมีบ้านที่มีสภาพคงทนถาวร หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["2821"],
            onChanged: (String value) {
              setState(() {
                home.answer["2821"] = value;
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
                      .popAndPushNamed("/survey", arguments: 7);
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
                      .popAndPushNamed("/survey", arguments: 9);
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
