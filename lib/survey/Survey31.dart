import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadioList.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey31 extends StatefulWidget {
  @override
  _Survey31State createState() => _Survey31State();
}

class _Survey31State extends State<Survey31> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    int count = home.countMember();
    home.answer["53111"] = count > 1 ? "1" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("31. ครอบครัวมีความอบอุ่น", style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              "31. สมาชิกอยู่ในครัวเรือนเดียวกัน",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem('มีสมาชิก 2 คนขึ้นไป', "1"),
              RadioItem("อยู่คนเดียว", "0"),
            ],
            groupValue: home.answer["53111"],
            onChanged: (String value) {},
          ),
          Visibility(
            visible: home.answer["53111"] == "1",
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "31.1 กรณีมีสมาชิก 2 คนขึ้นไป อยู่ในครัวเรือนเดียวกัน",
                    style: MyFont.h2Font,
                  ),
                ),
                ListTile(
                  title: Text(
                    "(1) สมาชิกในครอบครัวมีเวลาอยู่พร้อมหน้าและได้ทำกิจกรรมร่วมกันอย่างน้อยสัปดาห์ละ 1 ครั้ง หรือ อย่างน้อยเดือนละ 4 ครั้ง",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioList(
                  children: [
                    RadioItem('มี', "1"),
                    RadioItem("ไม่มี", "0"),
                  ],
                  groupValue: home.answer["53112"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["53112"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "(2) สมาชิกในครอบครัวมีความเคารพนับถือกันและไม่มีการทะเลาะเบาะแว้งรุนแรง",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioList(
                  children: [
                    RadioItem('มี', "1"),
                    RadioItem("ไม่มี", "0"),
                  ],
                  groupValue: home.answer["53113"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["53113"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "(3) สมาชิกในครอบครัว เมื่อมีปัญหาจะปรึกษาหารือและช่วยเหลือซึ่งกันและกัน",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioList(
                  children: [
                    RadioItem('มี', "1"),
                    RadioItem("ไม่มี", "0"),
                  ],
                  groupValue: home.answer["53114"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["53114"] = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Visibility(
            visible: home.answer["53111"] == "0",
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "31.2 กรณีอยู่คนเดียว",
                    style: MyFont.h2Font,
                  ),
                ),
                ListTile(
                  title: Text(
                    "(1) หากมีบิดา มารดา ลูกหลาน และญาติพี่น้อง ต้องมีการเดินทางเยี่ยมเยือน ระหว่างกัน อย่างน้อยปีละ 1 ครั้ง",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioList(
                  children: [
                    RadioItem('ไปเยี่ยมเยือน', "1"),
                    RadioItem("ไม่ไปเยี่ยมเยือน", "0"),
                  ],
                  groupValue: home.answer["53121"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["53121"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "(2) หากไม่มีบิดามารดาและญาติพี่น้อง ถ้าสามารถดำรงชีวิตได้อย่างมีความสุขก็ถือว่าเป็นครอบครัวอบอุ่น",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioList(
                  children: [
                    RadioItem('มีความสุข', "1"),
                    RadioItem("ไม่มีความสุข", "0"),
                  ],
                  groupValue: home.answer["53122"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["53122"] = value;
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
                      .popAndPushNamed("/survey", arguments: 30);
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
