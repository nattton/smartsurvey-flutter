import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey26 extends StatefulWidget {
  @override
  _Survey26State createState() => _Survey26State();
}

class _Survey26State extends State<Survey26> {
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
                '26. คนอายุ 6 ปีขึ้นไป ปฏิบัติกิจกรรมทางศาสนาอย่างน้อยสัปดาห์ละ 1 ครั้ง',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              'ในรอบปีที่ผ่านมา คนในครัวเรือนที่อายุตั้งแต่ 6 ปีขึ้นไปทุกคน ได้ปฏิบัติกิจกรรมทางศาสนาอย่างใดอย่างหนึ่ง  หรือหลายอย่าง อย่างน้อย สัปดาห์ละ 1 ครั้ง หรือไม่ (เช่น การร่วมพิธีกรรมทางศาสนา ทำบุญตักบาตร  ทำภาวนา/สมาธิ สวดมนต์ ฟังเทศน์ ฟังธรรม หรือการทำละหมาด และการเข้าโบสถ์คริสต์ เป็นต้น)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'ปฏิบัติทุกคน',
            value: "1",
            groupValue: home.answer["52611"],
            onChanged: (String value) {
              setState(() {
                home.answer["52611"] = value;
              });
            },
          ),
          LabeledRadioInputNumber(
            label: "ไม่ปฏิบัติ ... คน",
            value: "0",
            groupValue: home.answer["52611"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["52611"] = value;
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
                      .popAndPushNamed("/survey", arguments: 25);
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
                      .popAndPushNamed("/survey", arguments: 26);
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
