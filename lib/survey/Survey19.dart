import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey19 extends StatefulWidget {
  @override
  _Survey19State createState() => _Survey19State();
}

class _Survey19State extends State<Survey19> {
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
    int count15to59 = home.countMemberAgeRange(15, 59);
    home.answer["31911"] = count15to59 > 0 ? "1,$count15to59" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                '19. คนอายุ 15 - 59 ปี อ่าน เขียนภาษาไทย และคิดเลขอย่างง่ายได้ ',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '19.1 ครัวเรือนนี้ มีคนอายุ 15 - 59 ปี หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count15to59 คน',
            value: "1,$count15to59",
            groupValue: home.answer["31911"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 3)',
            value: "0",
            groupValue: home.answer["31911"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: home.answer["31911"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '19.2 คนอายุ 15 - 59 ปี สามารถ อ่าน เขียนภาษาไทย และคิดเลขอย่างง่ายได้ ทุกคนหรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้ทุกคน',
                    value: "1",
                    groupValue: home.answer["31921"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31921"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้ ... คน',
                    value: "0",
                    groupValue: home.answer["31921"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31921"] = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                        '19.3 คนอายุ 15 - 59 ปี สามารถอ่าน เขียนภาษาอังกฤษได้ ทุกคนหรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้ทุกคน',
                    value: "1",
                    groupValue: home.answer["31931"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31931"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้ ... คน',
                    value: "0",
                    groupValue: home.answer["31931"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31931"] = value;
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
                      .popAndPushNamed("/survey", arguments: 18);
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
                      .popAndPushNamed("/survey", arguments: 20);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
