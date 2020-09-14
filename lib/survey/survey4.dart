import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey4 extends StatefulWidget {
  @override
  _Survey4State createState() => _Survey4State();
}

class _Survey4State extends State<Survey4> {
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
                '4. ครัวเรือนกินอาหารถูกสุขลักษณะ ปลอดภัย และได้มาตรฐาน',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '4.1 ถ้ากินอาหารบรรจุสำเร็จ ต้องมีเครื่องหมาย อย. เช่น เกลือเสริมไอโอดีน น้ำปลา น้ำส้มสายชู อาหารกระป๋อง นม อาหารกล่อง เป็นต้น',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1411"],
            onChanged: (String value) {
              setState(() {
                home.answer["1411"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '4.2 ถ้ากินเนื้อสัตว์ต้องทำให้สุกด้วยความร้อน',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1421"],
            onChanged: (String value) {
              setState(() {
                home.answer["1421"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '4.3 ถ้ากินผักต้องเป็นผักปลอดสารพิษหรือได้ทำการแช่ด้วยน้ำผสมด่างทับทิมหรือน้ำยาล้างผักแล้วล้างด้วยน้ำสะอาดหลาย ๆ ครั้ง',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1431"],
            onChanged: (String value) {
              setState(() {
                home.answer["1431"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '4.4 ก่อนกินอาหารต้องล้างมือทุกครั้งและใช้ช้อนกลาง',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'ใช่',
            labelFalse: 'ไม่ใช่',
            groupValue: home.answer["1441"],
            onChanged: (String value) {
              setState(() {
                home.answer["1441"] = value;
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
                      .popAndPushNamed("/survey", arguments: 3);
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
                      .popAndPushNamed("/survey", arguments: 5);
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
