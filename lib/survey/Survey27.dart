import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey27 extends StatefulWidget {
  @override
  _Survey27State createState() => _Survey27State();
}

class _Survey27State extends State<Survey27> {
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
    int count60 = home.countMemberAgeRange(60, 150);
    home.answer["52711"] = count60 > 0 ? "1,$count60" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '27. ผู้สูงอายุได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ หรือภาคเอกชน',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '27.1 ครัวเรือนนี้ มีผู้สูงอายุ หรือไม่ (อายุ 60 ปีขึ้นไป)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count60 คน',
            value: "1,$count60",
            groupValue: home.answer["52711"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 28)',
            value: "0",
            groupValue: home.answer["52711"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: count60 > 0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '27.2 ผู้สูงอายุ ได้รับการดูแลเอาใจใส่ในชีวิตความเป็นอยู่ ด้านอาหารการกิน เสื้อผ้าเครื่องนุ่งห่ม และได้รับการดูแลเมื่อยามเจ็บไข้ได้ป่วย การดูแลเอาใจใส่ด้านสภาพจิตใจจากคนในครอบครัว หมู่บ้านหรือชุมชน รวมทั้งได้รับสวัสดิการชุมชนหรือเบี้ยยังชีพ จากภาครัฐ หรือภาคเอกชน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้รับทุกคน',
                    value: "1",
                    groupValue: home.answer["52721"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52721"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้รับ ... คน',
                    value: "0",
                    groupValue: home.answer["52721"],
                    question: "ไม่ได้รับ",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["52721"] = value;
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
                      .popAndPushNamed("/survey", arguments: 26);
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
                      .popAndPushNamed("/survey", arguments: 28);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
