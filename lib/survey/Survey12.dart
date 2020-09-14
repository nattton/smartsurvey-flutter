import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputText.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey12 extends StatefulWidget {
  @override
  _Survey12State createState() => _Survey12State();
}

class _Survey12State extends State<Survey12> {
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
            title:
                Text('12. ครัวเรือนไม่ถูกรบกวนจากมลพิษ', style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              "12.1 มีเสียงดัง อาจสังเกตจากคนที่ยืนห่างกัน 1 เมตร พูดคุยกันแล้ว คนฝ่ายหนึ่งไม่ได้ยินว่าอีกฝ่ายพูดอะไร หรือ ความรู้สึกของบุคคลว่ามีเสียงดังเกิดขึ้นจากสภาพปกติของพื้นที่นั้นๆ",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ไม่ถูกรบกวน',
            labelFalse: 'ถูกรบกวน',
            groupValue: home.answer["21211"],
            onChanged: (String value) {
              setState(() {
                home.answer["21211"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "12.2 มีความสั่นสะเทือน โดยจากความรู้สึกหรือการสั่นไหวของวัสดุ หรือภาชนะ สิ่งของต่างๆ ในครัวเรือน",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ไม่ถูกรบกวน',
            labelFalse: 'ถูกรบกวน',
            groupValue: home.answer["21221"],
            onChanged: (String value) {
              setState(() {
                home.answer["21221"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "12.3 มีฝุ่นละออง (1) ฝุ่นขนาดใหญ่ โดยการมองด้วยตาเปล่า (2) ฝุ่นขนาดเล็ก สังเกตจากการสะสมของฝุ่นบนพื้นผิวหน้าของภาชนะ อุปกรณ์ เครื่องใช้ภายในบ้าน",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ไม่ถูกรบกวน',
            labelFalse: 'ถูกรบกวน',
            groupValue: home.answer["21231"],
            onChanged: (String value) {
              setState(() {
                home.answer["21231"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "12.4 มีกลิ่นเหม็นที่รู้สึกไม่สบาย (โดยสอบถามจากความรู้สึกสัมผัสของบุคคลตั้งแต่ 3 คนขึ้นไป) เช่น วิงเวียนศีรษะ คลื่นไส้ ทำให้เกิดความวิตกกังวล รู้สึกอึดอัด เครียด เป็นต้น",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ไม่ถูกรบกวน',
            labelFalse: 'ถูกรบกวน',
            groupValue: home.answer["21241"],
            onChanged: (String value) {
              setState(() {
                home.answer["21241"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "12.5 มีน้ำเสีย โดยการสังเกตจากกลิ่นและสีที่ผิดไปจากธรรมชาติ",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ไม่ถูกรบกวน',
            labelFalse: 'ถูกรบกวน',
            groupValue: home.answer["21251"],
            onChanged: (String value) {
              setState(() {
                home.answer["21251"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "12.6 มีขยะหรือของเสียอันตราย (หลอดไฟ กระป๋องสเปรย์ ถ่านไฟฉาย ฯลฯ)โดยการมองเห็นหรือสังเกต เช่น ปริมาณขยะล้นจากภาชนะรองรับขยะ กลิ่นเหม็นจากขยะ ของเสียอันตรายไม่มีการแยกทิ้งอย่างถูกต้อง",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ไม่ถูกรบกวน',
            labelFalse: 'ถูกรบกวน',
            groupValue: home.answer["21261"],
            onChanged: (String value) {
              setState(() {
                home.answer["21261"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "12.7 หากครัวเรือนมีปัญหาตามข้อใดข้อหนึ่งใน 6 ข้อย่อยข้างต้น ให้ระบุว่าครัวเรือนตั้งอยู่ใกล้แหล่งใด",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'แหล่งอุตสาหกรรม',
            value: "1",
            groupValue: home.answer["21271"],
            onChanged: (String value) {
              setState(() {
                home.answer["21271"] = value;
              });
            },
          ),
          LabeledRadio(
            label: 'แหล่งเกษตรกรรม',
            value: "2",
            groupValue: home.answer["21271"],
            onChanged: (String value) {
              setState(() {
                home.answer["21271"] = value;
              });
            },
          ),
          LabeledRadioInputText(
            label: 'อื่น ๆ ...',
            value: "3",
            groupValue: home.answer["21271"],
            question: 'อื่น ๆ ...',
            onChanged: (String value) {
              setState(() {
                home.answer["21271"] = value;
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
                      .popAndPushNamed("/survey", arguments: 11);
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
                      .popAndPushNamed("/survey", arguments: 13);
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
