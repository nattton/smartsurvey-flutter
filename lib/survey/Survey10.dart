import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey10 extends StatefulWidget {
  @override
  _Survey10State createState() => _Survey10State();
}

class _Survey10State extends State<Survey10> {
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
                '10. ครัวเรือนมีน้ำใช้เพียงพอตลอดปี อย่างน้อยคนละ 45 ลิตรต่อวัน (ประมาณ 2 ปี๊บ) หรือไม่',
                style: MyFont.h1Font),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มีเพียงพอ',
            labelFalse: 'ไม่เพียงพอ',
            groupValue: home.answer["21011"],
            onChanged: (String value) {
              setState(() {
                home.answer["21011"] = value;
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
                      .popAndPushNamed("/survey", arguments: 9);
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
                      .popAndPushNamed("/survey", arguments: 11);
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
