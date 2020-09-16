import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey21 extends StatefulWidget {
  @override
  _Survey21State createState() => _Survey21State();
}

class _Survey21State extends State<Survey21> {
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
    int count60Ablity = home.countMemberAgeRange(60, 150);
    home.answer["42111"] = count60Ablity > 0 ? "1,$count60Ablity" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('21. คนอายุ 60 ปี ขึ้นไปมีอาชีพและรายได้',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '21.1 ครัวเรือนนี้ มีคนอายุ 60 ปีขึ้นไป หรือไม่ (ไม่นับรวมคนพิการที่ไม่สามารถช่วยตัวเองได้)',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count60Ablity คน',
            value: "1,$count60Ablity",
            groupValue: home.answer["42111"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 22)',
            value: "0",
            groupValue: home.answer["42111"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: home.answer["42111"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '21.2 คนอายุ 60 ปีขึ้นไป มีอาชีพและมีรายได้ ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledCheckBox(
                    label: 'ทุกคน',
                    value: "1",
                    groupValue: home.answer["42121"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42121"] = value;
                        if (value.isNotEmpty) {
                          home.answer["42122"] = "";
                          home.answer["42123"] = "";
                        }
                      });
                    },
                  ),
                  LabeledCheckBoxInputNumber(
                    label: 'ไม่มีอาชีพและไม่มี รายได้ ... คน',
                    value: "1",
                    groupValue: home.answer["42122"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42122"] = value;
                        if (value.isNotEmpty) {
                          home.answer["42121"] = "";
                        }
                      });
                    },
                  ),
                  LabeledCheckBoxInputNumber(
                    label: 'ไม่มีอาชีพแต่มีรายได้ ... คน',
                    value: "1",
                    groupValue: home.answer["42123"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42123"] = value;
                        if (value.isNotEmpty) {
                          home.answer["42121"] = "";
                        }
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                        '21.3 คนอายุ 60 ปีขึ้นไปที่มีอาชีพและมีรายได้จากการผลิตสินค้า OTOP กี่คน',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadioInputNumber(
                    label: 'จำนวน ... คน',
                    value: "1",
                    groupValue: home.answer["42131"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42131"] = value;
                      });
                    },
                  ),
                  LabeledRadio(
                    label: 'ไม่เป็นสมาชิกกลุ่ม OTOP',
                    value: "0",
                    groupValue: home.answer["42131"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["42131"] = value;
                      });
                    },
                  ),
                  Visibility(
                    visible: home.answer["42123"] != "" ||
                        home.answer["42122"] != "",
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                              '21.4 คนอายุ 60 ปีขึ้นไป ที่ไม่มีอาชีพ ตามข้อ 21.2 มีความสมัครใจที่จะประกอบอาชีพ กี่คน',
                              style: MyFont.h2Font),
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'จำนวน ... คน',
                          value: "1",
                          groupValue: home.answer["42141"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["42141"] = value;
                            });
                          },
                        ),
                        ListTile(
                          title: Text(
                              '21.5 คนอายุ 60 ปีขึ้นไปที่ไม่มีอาชีพและไม่มีรายได้ มีความสนใจผลิตสินค้า OTOP กี่คน',
                              style: MyFont.h2Font),
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'จำนวน ... คน',
                          value: "1",
                          groupValue: home.answer["42151"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["42151"] = value;
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
                      .popAndPushNamed("/survey", arguments: 20);
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
                      .popAndPushNamed("/survey", arguments: 22);
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
