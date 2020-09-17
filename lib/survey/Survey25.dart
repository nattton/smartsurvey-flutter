import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey25 extends StatefulWidget {
  @override
  _Survey25State createState() => _Survey25State();
}

class _Survey25State extends State<Survey25> {
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
            title: Text('25. คนในครัวเรือนไม่สูบบุหรี่', style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              'ทุกคนในครัวเรือนนี้ สูบบุหรี่ หรือไม่ (ยาสูบ ยาเส้น หรือยามวน)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'ไม่สูบบุหรี่ทุกคน',
            value: "0",
            groupValue: home.answer["52511"],
            onChanged: (String value) {
              setState(() {
                home.answer["52511"] = value;
              });
            },
          ),
          LabeledRadioInputNumber(
            label: "สูบบุหรี่ ... คน",
            value: "1",
            groupValue: home.answer["52511"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["52511"] = value;
              });
            },
          ),
          Visibility(
            visible: home.answer["52511"] != "0",
            child: LabeledCheckBox(
              label: 'ผู้ที่สูบบุหรี่เป็นผู้ที่หารายได้หลักให้กับครัวเรือน',
              value: "1",
              groupValue: home.answer["52512"],
              onChanged: (String newValue) {
                setState(() {
                  home.answer["52512"] = newValue;
                });
              },
            ),
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
                      .popAndPushNamed("/survey", arguments: 24);
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
                      .popAndPushNamed("/survey", arguments: 26);
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
