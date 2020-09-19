import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioList.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey14 extends StatefulWidget {
  @override
  _Survey14State createState() => _Survey14State();
}

class _Survey14State extends State<Survey14> {
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
            title: Text("14. ครัวเรือนมีความปลอดภัยในชีวิตและทรัพย์สิน",
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              "14.1 ในรอบปีที่ผ่านมา ครัวเรือนนี้ มีคนถูกฆ่าตาย หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem("ไม่มี", "1"),
              RadioItem('มี', "0"),
            ],
            groupValue: home.answer["21411"],
            onChanged: (String value) {
              setState(() {
                home.answer["21411"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "14.2 ในรอบปีที่ผ่านมา ครัวเรือนนี้ มีคนถูกทำร้ายร่างกาย กระทำอนาจาร  ข่มขืน กระทำชำเรา หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem("ไม่มี", "1"),
              RadioItem('มี', "0"),
            ],
            groupValue: home.answer["21421"],
            onChanged: (String value) {
              setState(() {
                home.answer["21421"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "14.3 ในรอบปีที่ผ่านมา ครัวเรือนนี้ มีคนถูกประทุษร้ายต่อทรัพย์ (ลักทรัพย์ วิ่งราวทรัพย์ ปล้นทรัพย์ หลอกลวงให้เสียทรัพย์) หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["21431"],
            onChanged: (String value) {
              setState(() {
                home.answer["21431"] = value;
              });
            },
          ),
          LabeledRadioInputNumber(
            label: 'มีมูลค่าทรัพย์สิน ที่เสียไป ... บาท',
            value: "1",
            groupValue: home.answer["21431"],
            question: "มีมูลค่าทรัพย์สิน",
            unit: "บาท",
            onChanged: (String value) {
              setState(() {
                home.answer["21431"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "14.5 ในรอบปีที่ผ่านมา ครัวเรือนนี้ ถูกบุกรุกที่อยู่อาศัย หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem("ไม่ถูกบุกรุก", "0"),
              RadioItem('ถูกบุกรุก', "1"),
            ],
            groupValue: home.answer["21451"],
            onChanged: (String value) {
              setState(() {
                home.answer["21451"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "14.6 ในรอบปีที่ผ่านมา ครัวเรือนนี้ มีอาชญากรรมอื่นๆ ที่เกี่ยวกับชีวิตและทรัพย์สิน อย่างใดอย่างหนึ่งหรือหลายอย่าง หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem("ไม่มี", "0"),
              RadioItem('มี', "1"),
            ],
            groupValue: home.answer["21461"],
            onChanged: (String value) {
              setState(() {
                home.answer["21461"] = value;
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
                      .popAndPushNamed("/survey", arguments: 13);
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
                      .popAndPushNamed("/survey", arguments: 15);
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
