import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey11 extends StatefulWidget {
  @override
  _Survey11State createState() => _Survey11State();
}

class _Survey11State extends State<Survey11> {
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
                '11. ครัวเรือนมีการจัดบ้านเรือนเป็นระเบียบเรียบร้อย สะอาด และถูกสุขลักษณะ',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '11.1 มีสภาพในบ้านสะอาด ห้องนอนลมพัดผ่านสะดวก ไม่มีฝุ่นละอองและกลิ่นเหม็นอับชื้น ที่หลับนอน ข้าวของเครื่องใช้สะอาด มีการจัดเก็บเป็นระเบียบ ไม่รกรุงรัง',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21111"],
            onChanged: (String value) {
              setState(() {
                home.answer["21111"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '11.2 มีที่ประกอบอาหารสะอาดเป็นระเบียบ มีตู้กับข้าวหรือฝาชี มีอุปกรณ์ล้างมือที่ใช้งานได้ดี (เช่น สบู่หรือน้ำยาล้างจาน) และมีการกำจัดไขมันก่อนล้าง',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21121"],
            onChanged: (String value) {
              setState(() {
                home.answer["21121"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.3 มีที่เก็บน้ำสะอาดเพื่อการอุปโภคบริโภคสภาพดี มีฝาปิด",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21131"],
            onChanged: (String value) {
              setState(() {
                home.answer["21131"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.4 มีการกำจัดสัตว์ แมลงที่เป็นพาหะนำโรค ได้แก่ ยุงลาย หนู แมลงวัน แมลงสาบ ไม่พบแหล่งเพาะพันธุ์ และที่หลบซ่อนอาศัยภายในบ้านหรือบริเวณบ้าน",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21141"],
            onChanged: (String value) {
              setState(() {
                home.answer["21141"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.5 มีการจัดการขยะ ดังนี้",
              style: MyFont.h1Font,
            ),
          ),
          ListTile(
            title: Text(
              "11.5.1	มีอุปกรณ์ อาทิ ไม้กวาด ถังขยะ ถุงใส่ขยะ",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21151"],
            onChanged: (String value) {
              setState(() {
                home.answer["21151"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.5.2 มีการคัดแยกขยะออกเป็น 4 ประเภท (1.ของเสียอันตราย 2.ขยะรีไซเคิล 3.เศษอาหาร  4.ขยะอื่นๆ)",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21152"],
            onChanged: (String value) {
              setState(() {
                home.answer["21152"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.5.3 มีการกำจัดขยะแห้ง เช่น ส่งให้ อปท. กำจัด หรือการฝังหลุม",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21153"],
            onChanged: (String value) {
              setState(() {
                home.answer["21153"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.5.4 มีการกำจัดขยะเปียกที่ถูกวิธี เช่น ทำปุ๋ยชีวภาพ ทำน้ำหมัก EM เป็นต้น",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21154"],
            onChanged: (String value) {
              setState(() {
                home.answer["21154"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.6 มีร่องระบายน้ำอยู่ในสภาพดี ไม่มีแหล่งน้ำขังในบ้าน และไม่มีการปล่อยน้ำเสียลงแหล่งน้ำสาธารณะ",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21161"],
            onChanged: (String value) {
              setState(() {
                home.answer["21161"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.7 มีส้วมใช้ที่มีสภาพแข็งแรงใช้งานได้สะอาด มีการระบายอากาศที่ดี ไม่มีการแตกร้าวที่หัวส้วม พื้นที่ ถังส้วม และฝาปิด และมีอุปกรณ์ทำความสะอาด",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21171"],
            onChanged: (String value) {
              setState(() {
                home.answer["21171"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "11.8 มีการจัดเก็บและแยกสารเคมีที่เป็นอันตรายออกจากเครื่องใช้อื่นๆ โดยจัดให้เป็นระเบียบและวางให้พ้นมือเด็ก",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21181"],
            onChanged: (String value) {
              setState(() {
                home.answer["21181"] = value;
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
                      .popAndPushNamed("/survey", arguments: 10);
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
                      .popAndPushNamed("/survey", arguments: 12);
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
