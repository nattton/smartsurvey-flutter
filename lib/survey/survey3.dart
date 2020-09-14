import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey3 extends StatefulWidget {
  @override
  _Survey3State createState() => _Survey3State();
}

class _Survey3State extends State<Survey3> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    int count = home.countMemberAgeRange(0, 12);
    home.answer["1311"] = (count > 0) ? "1,$count" : "0";

    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '3.3 ให้ระบุจำนวนเด็กที่ไม่ได้รับวัคซีน ในตารางข้างล่างนี้',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '3.1 ครัวเรือนนี้ มีเด็กแรกเกิดถึง 12 ปี หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count คน',
            value: "1,$count",
            groupValue: home.answer["1311"],
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 4)',
            value: "0",
            groupValue: home.answer["1311"],
          ),
          Visibility(
            visible: true,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      '3.2 เด็กแรกเกิดถึง 12 ปี ได้รับวัคซีนป้องกันโรค ครบตามตารางสร้างเสริมภูมิคุ้มกันโรค (ที่อยู่ด้านล่าง) ทุกคน หรือไม่',
                      style: MyFont.h2Font),
                ),
                LabeledRadio(
                  label: 'ทุกคน (ข้ามไปข้อ 4)',
                  value: "1",
                  groupValue: home.answer["1321"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["1321"] = value;
                    });
                  },
                ),
                LabeledRadioInputNumber(
                  label: 'ไม่ได้รับ ... คน',
                  value: "0",
                  groupValue: home.answer["1321"],
                  question: "ไม่ได้รับ",
                  unit: "คน",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["1321"] = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Visibility(
            visible: count > 0 && home.answer["1321"] != "1",
            child: Column(children: [
              ListTile(
                title: Text(
                    '3.3 ให้ระบุจำนวนเด็กที่ไม่ได้รับวัคซีน ในตารางข้างล่างนี้',
                    style: MyFont.h2Font),
              ),
              ListTile(
                title: Text(
                    'ตัวอย่างเช่น ครัวเรือนที่มีเด็กอายุ 1 ปี 2 คน และ ทั้ง 2 คน ไม่เคยได้รับวัคซีนเลย กรณีนี้ต้องกรอก 2 ทุกช่องตั้งแต่แรกเกิดจนถึง 1 ปี แต่ถ้าหากว่าเด็กคนหนึ่งได้รับวัคซีนครบถ้วน แต่เด็กอีกคนหนึ่งไม่ได้รับวัคซีนในช่วง 4 เดือนแรก กรณีนี้ต้องกรอก 1 ทุกช่องตั้งแต่แรกเกิดจนถึง 4 เดือนเป็นต้น',
                    style: MyFont.h3Font),
              ),
              Container(padding: EdgeInsets.all(8.0)),
              ListTile(
                title: Text('-แรกเกิด\n• ฉีดวัคซีนป้องกันวัณโรค,ตับอักเสบบี',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1331"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1331"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 1 เดือน\n• ฉีดวัคซีนป้องกันตับอักเสบบี (เฉพาะรายที่เด็กคลอดจากมารดาที่เป็นพาหะของไวรัสตับอักเสบบี)',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1332"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1332"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 2 เดือน\n• ฉีดวัคซีนรวมป้องกันคอตีบ ไอกรน บาดทะยัก ตับอักเสบบี โรคโปลิโอ ครั้งที่ 1',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1333"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1333"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 4 เดือน\n• ฉีดวัคซีนรวมป้องกันคอตีบ ไอกรน บาดทะยัก ตับอักเสบบี ครั้งที่ 2\n• ฉีดวัคซีนป้องกันโรคโปลิโอ 1 ครั้ง\n• กินวัคซีนป้องกันโรคโปลิโอ ครั้งที่ 2',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1334"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1334"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 6 เดือน\n• ฉีดวัคซีนรวมป้องกันคอตีบ ไอกรน บาดทะยัก ตับอักเสบบี ครั้งที่ 3\n• กินวัคซีนป้องกันโรคโปลิโอ ครั้งที่ 3',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1335"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1335"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 9-12 เดือน\n• ฉีดวัคซีนรวมป้องกันโรคหัด หัดเยอรมัน คางทูม ครั้งที่ 1',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1336"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1336"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 1 ปี\n• ฉีดวัคซีนป้องกันโรคไข้สมองอักเสบเจอี (ชนิดเชื้อตาย) ครั้งที่ 1 และ 2 \nห่างกัน 1 เดือน หรือ ฉีดวัคซีนป้องกันโรคไข้สมองอักเสบเจอี  \n(ชนิดเชื้อเป็น) ครั้งที่ 1',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1337"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1337"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 1 ปี 6 เดือน\n• ฉีดวัคซีนรวมป้องกันคอตีบ ไอกรน บาดทะยัก ครั้งที่ 4\n• กินวัคซีนป้องกันโรคโปลิโอ ครั้งที่ 4',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1338"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1338"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 2 ปี 6 เดือน\n• ฉีดวัคซีนรวมป้องกันโรคหัด คางทูม หัดเยอรมัน ครั้งที่ 2\n• ฉีดวัคซีนป้องกันโรคไข้สมองอักเสบเจอี (ชนิดเชื้อตาย) ครั้งที่ 3 หรือ ฉีดวัคซีนป้องกันโรคไข้สมองอักเสบเจอี (ชนิดเชื้อเป็น) ครั้งที่ 2',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["1339"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["1339"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 4 ปี\n• ฉีดวัคซีนรวมป้องกันคอตีบ ไอกรน บาดทะยัก ครั้งที่ 5\n• กินวัคซีนป้องกันโรคโปลิโอ ครั้งที่ 5',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["13310"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["13310"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 7 ปี\n• ฉีดวัคซีนป้องกันโรคหัด หัดเยอรมัน ครั้งที่ 2 (ตรวจสอบประวัติและให้ในรายที่ได้รับไม่ครบถ้วนตามเกณฑ์)\n• ฉีดวัคซีนป้องกันโรคคอตีบ บาดทะยัก • กินวัคซีนป้องกันโรคโปลิโอ (ตรวจสอบประวัติและให้ในรายที่ได้รับไม่ครบถ้วนตามเกณฑ์)\n• ฉีดวัคซีนป้องกันวัณโรค (ในกรณีที่ไม่มีหลักฐานว่าเคยได้รับเมื่อแรกเกิดและไม่มีแผลเป็น)',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["13311"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["13311"] = value;
                  });
                },
              ),
              ListTile(
                title: Text(
                    '- 12 ปี\n• ฉีดวัคซีนป้องกันคอตีบและบาดทะยัก (ทุกคน)',
                    style: MyFont.h2Font),
              ),
              LabeledRadioTrueFalse(
                labelTrue: 'ได้รับ',
                labelFalse: 'ไม่ได้รับ',
                groupValue: home.answer["13312"],
                onChanged: (String value) {
                  setState(() {
                    home.answer["13312"] = value;
                  });
                },
              ),
            ]),
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
                      .popAndPushNamed("/survey", arguments: 2);
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
                      .popAndPushNamed("/survey", arguments: 4);
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
