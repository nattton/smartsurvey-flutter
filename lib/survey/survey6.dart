import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputText.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey6 extends StatefulWidget {
  @override
  _Survey6State createState() => _Survey6State();
}

class _Survey6State extends State<Survey6> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);
    home = app.currentHome;
    int count = home.countMemberAgeRange(35, 150);
    home.answer["1631"] = (count > 0) ? "1,$count" : "0";

    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('6. คนอายุ 35 ปีขึ้นไป ได้รับการตรวจสุขภาพประจำปี',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '6.1 จำนวนคนในครัวเรือนที่มีประกันสุขภาพ/ สิทธิรักษาพยาบาล ดังต่อไปนี้ (ตอบได้มากกว่า 1 ข้อ)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledCheckBoxInputNumber(
            label: '1. ประกันสุขภาพเอกชน ... คน',
            groupValue: home.answer["1611"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1611"] = value;
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: '2. สิทธิข้าราชการ ... คน',
            groupValue: home.answer["1612"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1612"] = value;
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: '3. สิทธิประกันสังคม ... คน',
            groupValue: home.answer["1613"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1613"] = value;
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: '4. สิทธิสำนักงานหลักประกันสุขภาพแห่งชาติ ... คน',
            groupValue: home.answer["1614"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1614"] = value;
              });
            },
          ),
          LabeledCheckBoxInputText(
            label: '5. อื่นๆ ...',
            groupValue: home.answer["1615"],
            question: "อื่นๆ ...",
            unit: "... , ... คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1615"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '6.2 ในรอบปีที่ผ่านมา จำนวนคนในครัวเรือนที่ใช้บริการสถานพยาบาล ดังต่อไปนี้',
              style: MyFont.h2Font,
            ),
          ),
          LabeledCheckBoxInputNumber(
            label: '1. สถานีอนามัย/โรงพยาบาลส่งเสริมสุขภาพตำบล ... คน',
            groupValue: home.answer["1621"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1621"] = value;
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: '2. โรงพยาบาลของรัฐ ... คน',
            groupValue: home.answer["1622"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1622"] = value;
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: '3. โรงพยาบาลเอกชน ... คน',
            groupValue: home.answer["1623"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1623"] = value;
              });
            },
          ),
          LabeledCheckBoxInputNumber(
            label: '4. คลินิก ... คน',
            groupValue: home.answer["1624"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1624"] = value;
              });
            },
          ),
          LabeledCheckBoxInputText(
            label: '5. อื่นๆ ...',
            groupValue: home.answer["1625"],
            question: "อื่นๆ ...",
            unit: "... , ... คน",
            onChanged: (String value) {
              setState(() {
                home.answer["1625"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '6.3 ครัวเรือนนี้ มีคนอายุตั้งแต่ 35 ปี ขึ้นไป หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count คน',
            value: "1,$count",
            groupValue: home.answer["1631"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 7)',
            value: "0",
            groupValue: home.answer["1631"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: home.answer["1631"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '6.4 ในรอบปีที่ผ่านมา คนอายุตั้งแต่ 35 ปีขึ้นไป ได้รับการตรวจสุขภาพประจำปี ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับการตรวจทุกคน (ข้ามไปข้อ 7)',
                    value: "1",
                    groupValue: home.answer["1641"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["1641"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับการตรวจ ... คน',
                    value: "0",
                    groupValue: home.answer["1641"],
                    question: "ไม่ได้รับการตรวจ",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["1641"] = value;
                      });
                    },
                  )
                ],
              )),
          Visibility(
              visible: home.answer["1641"] != "1",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '6.5 คนที่ไม่ได้รับการตรวจสุขภาพประจำปี ตามข้อ 6.4 ได้รับการตรวจคัดกรองความเสี่ยงต่อโรคเบาหวานและความดันโลหิตสูง ทุกคน หรือไม่่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับการตรวจทุกคน',
                    value: "1",
                    groupValue: home.answer["1651"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["1651"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับการตรวจ ... คน',
                    value: "0",
                    groupValue: home.answer["1651"],
                    question: "ไม่ได้รับการตรวจ",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["1651"] = value;
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
                      .popAndPushNamed("/survey", arguments: 5);
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
                      .popAndPushNamed("/survey", arguments: 7);
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
