import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey28 extends StatefulWidget {
  @override
  _Survey28State createState() => _Survey28State();
}

class _Survey28State extends State<Survey28> {
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
    int countDisabled = home.countMemberDisabled();
    home.answer["52811"] = countDisabled > 0 ? "1,$countDisabled" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '28. ผู้พิการได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ หรือภาคเอกชน (ตามพรบ. ส่งเสริมคุณภาพชีวิตคนพิการ พ.ศ.2550 และที่แก้ไขเพิ่มเติม ฉบับที่ 2 พ.ศ. 2556)',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '28.1 ครัวเรือนนี้ มีผู้พิการ หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $countDisabled คน',
            value: "1,$countDisabled",
            groupValue: home.answer["52811"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 29)',
            value: "0",
            groupValue: home.answer["52811"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: countDisabled > 0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '28.2 ผู้พิการตามข้อ 28.1 มีบัตรประจำตัวคนพิการ หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'มีทุกคน',
                    value: "1",
                    groupValue: home.answer["52821"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52821"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่มี ... คน',
                    value: "0",
                    groupValue: home.answer["52821"],
                    question: "ไม่มี",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52821"] = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                        '28.3 ผู้พิการได้รับการดูแลเอาใจใส่ในชีวิตความเป็นอยู่ ด้านอาหารการกิน เสื้อผ้าเครื่องนุ่งห่ม และได้รับการดูแลเมื่อยามเจ็บไข้ได้ป่วยการดูแลเอาใจใส่ด้านสภาพจิตใจจากคนในครอบครัว หมู่บ้านหรือชุมชน รวมทั้งได้รับสวัสดิการชุมชนหรือเบี้ยยังชีพจากภาครัฐ หรือภาคเอกชน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับทุกคน',
                    value: "1",
                    groupValue: home.answer["52831"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52831"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับ ... คน',
                    value: "0",
                    groupValue: home.answer["52831"],
                    question: "ไม่ได้รับ",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52831"] = value;
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
                      .popAndPushNamed("/survey", arguments: 27);
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
                      .popAndPushNamed("/survey", arguments: 29);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
