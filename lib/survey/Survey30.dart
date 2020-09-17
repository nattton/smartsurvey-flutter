import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey30 extends StatefulWidget {
  @override
  _Survey30State createState() => _Survey30State();
}

class _Survey30State extends State<Survey30> {
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
                '30. ครัวเรือนมีส่วนร่วมทำกิจกรรมสาธารณะเพื่อประโยชน์ของชุมชนหรือท้องถิ่น',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              'ในรอบปีที่ผ่านมา คนในครัวเรือนมีส่วนร่วมทำกิจกรรมสาธารณะเพื่อประโยชน์ของชุมชนหรือท้องถิ่น หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มีส่วนร่วม',
            value: "1",
            groupValue: home.answer["5301"],
            onChanged: (String value) {
              setState(() {
                home.answer["5301"] = value;
              });
            },
          ),
          LabeledRadio(
            label: 'ไม่มีส่วนร่วม',
            value: "0",
            groupValue: home.answer["5301"],
            onChanged: (String value) {
              setState(() {
                home.answer["5301"] = value;
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
                      .popAndPushNamed("/survey", arguments: 29);
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
                      .popAndPushNamed("/survey", arguments: 31);
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
