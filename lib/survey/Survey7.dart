import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey7 extends StatefulWidget {
  @override
  _Survey7State createState() => _Survey7State();
}

class _Survey7State extends State<Survey7> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    int count = home.countMemberAgeRange(35, 150);
    home.answer["1631"] = (count > 0) ? "1,$count" : "0";

    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '7. คนอายุ 6 ปีขึ้นไป ออกกำลังกายอย่างน้อยสัปดาห์ละ 3 วัน ๆ ละ 30 นาที',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '7.1 คนอายุตั้งแต่ 6 ปีขึ้นไป ทุกคนในครัวเรือนนี้ได้ออกกำลังกายอย่างน้อยสัปดาห์ละ 3 วัน ๆ ละ 30 นาที หรือ ได้ออกแรง/ออกกำลังติดต่อกันอย่างน้อย 10 นาที ขึ้นไป รวมกันทั้งวัน 30 นาที อย่างน้อยสัปดาห์ละ 5 วัน หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledCheckBox(
            label: 'ได้ออกกำลังกาย หรือได้ออกแรง/ ออกกำลังทุกคน',
            value: "1",
            groupValue: home.answer["1711"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["1711"] = newValue;
                if (newValue != "") {
                  home.answer["1714"] = "";
                }
              });
            },
          ),
          Visibility(
            visible: home.answer["1711"] == "1",
            child: LabeledCheckBoxInputNumber(
              label: 'ได้ออกกำลังกาย ... คน',
              groupValue: home.answer["1712"],
              question: "จำนวน",
              unit: "คน",
              onChanged: (String value) {
                setState(() {
                  home.answer["1712"] = value;
                });
              },
            ),
          ),
          Visibility(
            visible: home.answer["1711"] == "1",
            child: LabeledCheckBoxInputNumber(
              label: 'ได้ออกแรง / ออกกำลัง ... คน',
              groupValue: home.answer["1713"],
              question: "จำนวน",
              unit: "คน",
              onChanged: (String value) {
                setState(() {
                  home.answer["1713"] = value;
                });
              },
            ),
          ),
          LabeledCheckBoxInputNumber(
            label: 'ไม่ได้ออกกำลังกายหรือไม่ได้ออกแรง/ไม่ได้ออกกำลัง ... คน',
            groupValue: home.answer["1714"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1714"] = value;
                if (value != "") {
                  home.answer["1711"] = "";
                  home.answer["1712"] = "";
                  home.answer["1713"] = "";
                }
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
                      .popAndPushNamed("/survey", arguments: 6);
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
                      .popAndPushNamed("/survey", arguments: 8);
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
