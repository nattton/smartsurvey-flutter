import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputText.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputText.dart';
import 'package:smartsurveys/widgets/LabeledRadioList.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/LabeledTextNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey23 extends StatefulWidget {
  @override
  _Survey23State createState() => _Survey23State();
}

class _Survey23State extends State<Survey23> {
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
            title: Text("23. ครัวเรือนมีการเก็บออมเงิน", style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              "23.1 ในรอบปีที่ผ่านมา ครัวเรือนมีการเก็บออมเงิน  ในรูปแบบใดบ้าง (เลือกได้มากกว่า 1 ข้อ)",
              style: MyFont.h2Font,
            ),
          ),
          LabeledCheckBox(
            label: 'เงินสด',
            value: "1",
            groupValue: home.answer["42311"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42311"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'เงินฝากธนาคาร',
            value: "1",
            groupValue: home.answer["42312"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42312"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'เงินฝากสหกรณ์',
            value: "1",
            groupValue: home.answer["42313"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42312"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'เงินฝากกลุ่มออมทรัพย์ฯ',
            value: "1",
            groupValue: home.answer["42314"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42314"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'เงินฝากกองทุนชุมชน',
            value: "1",
            groupValue: home.answer["42315"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42315"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'เงินฝากกองทุนการออมแห่งชาติ (กอช.)',
            value: "1",
            groupValue: home.answer["42316"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42316"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'ทำประกันชีวิต',
            value: "1",
            groupValue: home.answer["42317"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42317"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'ซื้อพันธบัตร',
            value: "1",
            groupValue: home.answer["42318"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42318"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'ซื้อทองคำ',
            value: "1",
            groupValue: home.answer["42319"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["42319"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'ซื้อบ้านหรือที่ดิน',
            value: "1",
            groupValue: home.answer["423110"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["423110"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBoxInputText(
            label: 'อื่นๆ ...',
            value: "1",
            groupValue: home.answer["423111"],
            question: "อื่นๆ ...",
            unit: "",
            onChanged: (String newValue) {
              setState(() {
                home.answer["423111"] = newValue;
                home.answer["423112"] = "";
              });
            },
          ),
          LabeledCheckBox(
            label: 'ไม่มีการออมเงิน (ข้ามไปข้อ 24)',
            value: "1",
            groupValue: home.answer["423112"],
            onChanged: (String newValue) {
              setState(() {
                home.answer["423112"] = newValue;
                home.answer["42311"] = "";
                home.answer["42312"] = "";
                home.answer["42313"] = "";
                home.answer["42314"] = "";
                home.answer["42315"] = "";
                home.answer["42316"] = "";
                home.answer["42317"] = "";
                home.answer["42318"] = "";
                home.answer["42319"] = "";
                home.answer["423110"] = "";
                home.answer["423111"] = "";
              });
            },
          ),
          Visibility(
            visible: home.answer["423112"] != "1",
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "23.2 ในรอบปีที่ผ่านมา ครัวเรือน มีการเก็บออมเงิน ตามข้อ 23.1 ปีละกี่บาท",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledTextNumber(
                  label: "... บาท",
                  groupValue: home.answer["42321"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42321"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "23.3 ครัวเรือนมีผู้ถือบัตรสวัสดิการแห่งรัฐ",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'มี ... คน',
                  value: "1",
                  groupValue: home.answer["42331"],
                  question: "จำนวน",
                  unit: "คน",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42331"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ไม่มี',
                  value: "0",
                  groupValue: home.answer["42331"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42331"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "23.4 ครัวเรือนได้รับการจัดสวัสดิการจากรัฐ",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioInputText(
                  label: 'ได้ (โปรดระบุ) ...',
                  value: "1",
                  groupValue: home.answer["42341"],
                  question: "",
                  unit: "...",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42341"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ไม่ได้',
                  value: "0",
                  groupValue: home.answer["42341"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42341"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "23.5 ครัวเรือนได้รับการจัดสวัสดิการจากชุมชน",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadioInputText(
                  label: 'ได้ (โปรดระบุ) ...',
                  value: "1",
                  groupValue: home.answer["42351"],
                  question: "",
                  unit: "...",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42351"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ไม่มี',
                  value: "0",
                  groupValue: home.answer["42351"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["42351"] = value;
                    });
                  },
                ),
              ],
            ),
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
                      .popAndPushNamed("/survey", arguments: 22);
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
                      .popAndPushNamed("/survey", arguments: 24);
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
