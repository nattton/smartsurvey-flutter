import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey5 extends StatefulWidget {
  @override
  _Survey5State createState() => _Survey5State();
}

class _Survey5State extends State<Survey5> {
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
                '5. ครัวเรือนมีการใช้ยาเพื่อบำบัด บรรเทาอาการเจ็บป่วยเบื้องต้นอย่างเหมาะสม',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '5.1 ใช้ยาสามัญประจำบ้าน',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1511"],
            onChanged: (String value) {
              setState(() {
                home.answer["1511"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '5.2 ไม่กินยาชุดที่ซื้อจากร้านขายของชำ',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1521"],
            onChanged: (String value) {
              setState(() {
                home.answer["1521"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '5.3 ไม่กินยาสมุนไพรหรือยาแผนโบราณที่ไม่ได้ปรับปรุงขึ้นเฉพาะสำหรับตน (ยกเว้นยาสามัญประจำบ้านแผนโบราณ)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1531"],
            onChanged: (String value) {
              setState(() {
                home.answer["1531"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '5.4 ไม่กินผลิตภัณฑ์เสริมอาหารที่อวดอ้างสรรพคุณเกินจริง โดยแสดงสรรพคุณเป็นยาเพื่อบำบัด บรรเทา รักษาโรค ซึ่งไม่ตรงกับที่แสดงในฉลาก',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1541"],
            onChanged: (String value) {
              setState(() {
                home.answer["1541"] = value;
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
                      .popAndPushNamed("/survey", arguments: 4);
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
                      .popAndPushNamed("/survey", arguments: 6);
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
