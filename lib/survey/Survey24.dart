import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey24 extends StatefulWidget {
  @override
  _Survey24State createState() => _Survey24State();
}

class _Survey24State extends State<Survey24> {
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
              '24. ทุกคนในครัวเรือนนี้ ดื่มสุรา หรือไม่',
              style: MyFont.h1Font,
            ),
          ),
          LabeledCheckBox(
            label: 'ไม่ดื่มสุราทุกคน',
            value: "1",
            groupValue: home.answer["52411"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["52411"] = newValue;
                if (home.answer["52411"] == "1") {
                  home.answer["52412"] = "";
                  home.answer["52413"] = "";
                  home.answer["52414"] = "";
                }
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: 'ดื่มสุรา ต่ำกว่า 15 ปี ... คน',
            groupValue: home.answer["52412"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["52412"] = value;
                if (value != "") {
                  home.answer["52411"] = "";
                }
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: 'ดื่มสุรา 15-19 ปี ... คน',
            groupValue: home.answer["52413"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["52413"] = value;
                if (value != "") {
                  home.answer["52411"] = "";
                }
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: "ดื่มสุรา 20 ปีขึ้นไป ... คน",
            groupValue: home.answer["52414"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["52414"] = value;
                if (value != "") {
                  home.answer["52411"] = "";
                }
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label:
                "หากผู้ที่ดื่มสุราเป็นผู้ที่หารายได้หลักให้กับครัวเรือน ดื่มสุราเฉลี่ยเดือนละ ... ครั้ง",
            groupValue: home.answer["52415"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["52415"] = value;
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
                      .popAndPushNamed("/survey", arguments: 23);
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
                      .popAndPushNamed("/survey", arguments: 25);
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
