import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey29 extends StatefulWidget {
  @override
  _Survey29State createState() => _Survey29State();
}

class _Survey29State extends State<Survey29> {
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
    int countSick = home.countMemberSick();
    home.answer["52911"] = countSick > 0 ? "1,$countSick" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '29. ผู้ป่วยโรคเรื้อรังได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ  หรือภาคเอกชน',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '29.1 ครัวเรือนนี้ มีผู้ป่วยโรคเรื้อรัง หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $countSick คน',
            value: "1,$countSick",
            groupValue: home.answer["52911"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 30)',
            value: "0",
            groupValue: home.answer["52911"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: countSick > 0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '29.2 ผู้ป่วยโรคเรื้อรัง ได้รับการดูแลเอาใจใส่ในชีวิต ความเป็นอยู่ ด้านอาหารการกิน เสื้อผ้าเครื่องนุ่งห่ม และได้รับการดูแลเมื่อยามเจ็บไข้   ได้ป่วย การดูแลเอาใจใส่ด้านสภาพจิตใจ  จากคนในครอบครัว หมู่บ้านหรือชุมชน รวมทั้งได้รับสวัสดิการชุมชน หรือความช่วยจากภาครัฐ หรือภาคเอกชน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับทุกคน',
                    value: "1",
                    groupValue: home.answer["52921"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52921"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับ ... คน',
                    value: "0",
                    groupValue: home.answer["52921"],
                    question: "ไม่ได้รับ",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52921"] = value;
                      });
                    },
                  ),
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
                      .popAndPushNamed("/survey", arguments: 28);
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
                      .popAndPushNamed("/survey", arguments: 30);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
