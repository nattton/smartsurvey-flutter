import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey15 extends StatefulWidget {
  @override
  _Survey15State createState() => _Survey15State();
}

class _Survey15State extends State<Survey15> {
  SurveyApp app;
  Home home;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    int count = home.countMemberAgeLessThan1Year();
    home.answer["31511"] = count > 0 ? "1,$count" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '15. เด็กอายุ 3 - 5 ปี ได้รับการบริการเลี้ยงดูเตรียมความพร้อมก่อนวัยเรียน',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '15.1 ครัวเรือนนี้ มีเด็กอายุ 3 - 5 ปี หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count คน',
            value: "1,$count",
            groupValue: home.answer["31511"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 16)',
            value: "0",
            groupValue: home.answer["31511"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: home.answer["31511"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '15.2 เด็กอายุ 3 - 5 ปี ได้รับการบริการเลี้ยงดูเตรียมความพร้อม ก่อนวัยเรียนในศูนย์พัฒนาเด็กเล็ก ศูนย์พัฒนาเด็กเล็กเคลื่อนที่ ศูนย์พัฒนาเด็กเล็กก่อนเกณฑ์ขององค์กรปกครองส่วนท้องถิ่น สถาบันศาสนา อนุบาลชนบท โรงเรียนอนุบาล เป็นต้น หรือได้เข้าร่วมกิจกรรมเกี่ยวกับการเตรียมความพร้อมของเด็กก่อนวัยเรียน ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับบริการทุกคน',
                    value: "1",
                    groupValue: home.answer["31521"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31521"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับบริการ ... คน',
                    value: "0",
                    groupValue: home.answer["31521"],
                    question: "ไม่ได้รับบริการ",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31521"] = value;
                      });
                    },
                  )
                ],
              )),
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
                      .popAndPushNamed("/survey", arguments: 14);
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
