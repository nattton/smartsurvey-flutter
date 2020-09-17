import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey20 extends StatefulWidget {
  @override
  _Survey20State createState() => _Survey20State();
}

class _Survey20State extends State<Survey20> {
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
    // int count15to59Ablity = home.countMemberAge15to59Ability();
    int count15to59Ablity = home.countMemberAgeRange(15, 59);
    home.answer["42011"] = count15to59Ablity > 0 ? "1,$count15to59Ablity" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('20. คนอายุ 15 - 59 ปี มีอาชีพและรายได้',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '20.1 ครัวเรือนนี้ มีคนอายุ 15 - 59 ปี หรือไม่ (ไม่นับรวมผู้ที่กำลังศึกษาอย่างเดียว โดยไม่ประกอบอาชีพ และคนพิการที่ไม่สามารถช่วยเหลือตนเองได้)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count15to59Ablity คน',
            value: "1,$count15to59Ablity",
            groupValue: home.answer["42011"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 21)',
            value: "0",
            groupValue: home.answer["42011"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: home.answer["42011"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '20.2 คนอายุ 15 - 59 ปี มีอาชีพและมีรายได้ ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledCheckBox(
                    label: 'ทุกคน (ข้ามไปข้อ 21)',
                    value: "1",
                    groupValue: home.answer["42021"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42021"] = value;
                        if (value.isNotEmpty) {
                          home.answer["42022"] = "";
                          home.answer["42023"] = "";
                        }
                      });
                    },
                  ),
                  LabeledCheckBoxInputNumber(
                    label: 'ไม่มีอาชีพและไม่มี รายได้ ... คน',
                    value: "1",
                    groupValue: home.answer["42022"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42022"] = value;
                        if (value.isNotEmpty) {
                          home.answer["42021"] = "";
                        }
                      });
                    },
                  ),
                  LabeledCheckBoxInputNumber(
                    label: 'ไม่มีอาชีพแต่มีรายได้ ... คน',
                    value: "1",
                    groupValue: home.answer["42023"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42023"] = value;
                        if (value.isNotEmpty) {
                          home.answer["42021"] = "";
                        }
                      });
                    },
                  ),
                  Visibility(
                    visible: home.answer["42021"] != "1",
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                              '20.3 คนอายุ 15 - 59 ปี ที่ไม่มีอาชีพ ตามข้อ 20.2 มีความสมัครใจที่จะประกอบอาชีพ กี่คน',
                              style: MyFont.h2Font),
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'จำนวน ... คน',
                          groupValue: home.answer["42031"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["42031"] = value;
                            });
                          },
                        ),
                      ],
                    ),
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
                      .popAndPushNamed("/survey", arguments: 19);
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
                      .popAndPushNamed("/survey", arguments: 21);
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
