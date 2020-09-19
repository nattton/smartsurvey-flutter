import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey2 extends StatefulWidget {
  @override
  _Survey2State createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    int count = home.countMemberAgeLessThan1Year();
    home.answer["1211"] = count > 0 ? "1,$count" : "0";

    int count6Mto1Y = home.countMemberAge6MonthsTo1Year();
    home.answer["1231"] = count6Mto1Y > 0 ? "1,$count6Mto1Y" : "0";

    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '2. เด็กแรกเกิดได้กินนมแม่อย่างเดียวอย่างน้อย 6 เดือนแรกติดต่อกัน',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '2.1 ครัวเรือนนี้ มีเด็กอายุน้อยกว่า 6 เดือน หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count คน',
            value: "1,$count",
            groupValue: home.answer["1211"],
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 2.3)',
            value: "0",
            groupValue: home.answer["1211"],
          ),
          ListTile(
            title: Text(
              '2.2 เด็กอายุน้อยกว่า 6 เดือน ได้กินนมแม่อย่างเดียว ตั้งแต่แรกเกิดเป็นเวลาติดต่อกันจนถึงวันที่สำรวจทุกคน หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'ทุกคน',
            value: "1",
            groupValue: home.answer["1221"],
            onChanged: (String value) {
              setState(() {
                home.answer["1221"] = value;
              });
            },
          ),
          LabeledRadioInputNumber(
            label: 'ไม่ได้กิน ... คน',
            value: "0",
            groupValue: home.answer["1221"],
            question: "น้อยกว่า",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1221"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '2.3 ครัวเรือนนี้ มีเด็กอายุตั้งแต่ 6 เดือน ถึง 1 ปี หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count6Mto1Y คน',
            value: "1,$count6Mto1Y",
            groupValue: home.answer["1231"],
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 3)',
            value: "0",
            groupValue: home.answer["1231"],
          ),
          Visibility(
            visible: home.answer["1231"] != "0",
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '2.4 เด็กอายุตั้งแต่ 6 เดือนถึง 1 ปี ได้กินนมแม่อย่างเดียว เป็นระยะเวลา 6 เดือนแรกติดต่อกัน ทุกคน หรือไม่',
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadio(
                  label: 'ทุกคน',
                  value: "1",
                  groupValue: home.answer["1241"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["1241"] = value;
                    });
                  },
                ),
                LabeledRadioInputNumber(
                  label: 'ไม่ได้กิน ... คน',
                  value: "0",
                  groupValue: home.answer["1241"],
                  question: "ไม่ได้กิน",
                  unit: "คน",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["1241"] = value;
                    });
                  },
                ),
              ],
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
                      .popAndPushNamed("/survey", arguments: 1);
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
                      .popAndPushNamed("/survey", arguments: 3);
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
