import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioList.dart';
import 'package:smartsurveys/widgets/LabeledRadioTrueFalse.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey13 extends StatefulWidget {
  @override
  _Survey13State createState() => _Survey13State();
}

class _Survey13State extends State<Survey13> {
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
                "13. ครัวเรือนมีการป้องกันอุบัติภัย และภัยธรรมชาติอย่างถูกวิธี",
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              "13.1 ครัวเรือนมีการป้องกันอุบัติภัยและภัยธรรมชาติอย่างถูกวิธี หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          ListTile(
            title: Text(
              "1) มีการป้องกันอุบัติภัยเมื่อขับขี่ยานพาหนะ",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21311"],
            onChanged: (String value) {
              setState(() {
                home.answer["21311"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "2) มีการป้องกันอุบัติภัยเมื่อใช้เครื่องใช้ไฟฟ้า",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21312"],
            onChanged: (String value) {
              setState(() {
                home.answer["21312"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "3) มีการป้องกันอันตรายหรืออุบัติเหตุจากการประกอบอาชีพ เช่น ปฏิบัติตามคำแนะนำในการใช้สารเคมี การใช้อุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคล (การสวมแว่นตาหน้ากากหรือผ้าปิดจมูก ถุงมือยาง ฯลฯ)",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21313"],
            onChanged: (String value) {
              setState(() {
                home.answer["21313"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "4) มีการเตรียมความพร้อมเพื่อรับมือกับภัยธรรมชาติ",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioTrueFalse(
            labelTrue: 'มี',
            labelFalse: 'ไม่มี',
            groupValue: home.answer["21314"],
            onChanged: (String value) {
              setState(() {
                home.answer["21314"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              "13.2 ในรอบปีที่ผ่านมา ครัวเรือนประสบภัยธรรมชาติ หรือไม่",
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem("ไม่ประสบภัย (ข้ามไปข้อ 13.3)", "1"),
              RadioItem('ประสบภัย', "0"),
            ],
            groupValue: home.answer["21321"],
            onChanged: (String value) {
              setState(() {
                home.answer["21321"] = value;
              });
            },
          ),
          Visibility(
            visible: home.answer["21321"] == "1",
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "13.2.1 ในรอบปีที่ผ่านมา ครัวเรือนประสบภัยธรรมชาติ ด้านใดบ้าง ระบุได้มากกว่า 1 ด้าน",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledCheckBox(
                  label: 'อุทกภัย',
                  value: home.answer["213221"] == "1",
                  onChanged: (bool newValue) {
                    setState(() {
                      home.answer["213221"] = newValue ? "1" : "0";
                    });
                  },
                ),
                LabeledCheckBox(
                  label: 'วาตภัย',
                  value: home.answer["213222"] == "1",
                  onChanged: (bool newValue) {
                    setState(() {
                      home.answer["213222"] = newValue ? "1" : "0";
                    });
                  },
                ),
                LabeledCheckBox(
                  label: 'อัคคีภัย',
                  value: home.answer["213223"] == "1",
                  onChanged: (bool newValue) {
                    setState(() {
                      home.answer["213223"] = newValue ? "1" : "0";
                    });
                  },
                ),
                LabeledCheckBox(
                  label: 'ดินโคลนถล่ม',
                  value: home.answer["213224"] == "1",
                  onChanged: (bool newValue) {
                    setState(() {
                      home.answer["213224"] = newValue ? "1" : "0";
                    });
                  },
                ),
                LabeledCheckBox(
                  label: 'แผ่นดินไหว',
                  value: home.answer["213225"] == "1",
                  onChanged: (bool newValue) {
                    setState(() {
                      home.answer["213225"] = newValue ? "1" : "0";
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "13.3 ในรอบปีที่ผ่านมา มีคนในครัวเรือนที่ได้รับ ความเจ็บป่วย จากการทำงาน จนเป็นเหตุให้ต้องหยุดงาน หรือไม่",
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadio(
                  label: "ไม่มี",
                  value: "0",
                  groupValue: home.answer["21331"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["21331"] = value;
                    });
                  },
                ),
                LabeledRadioInputNumber(
                  label: 'มี ... คน',
                  value: "1",
                  groupValue: home.answer["21331"],
                  question: "",
                  unit: "คน",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["21331"] = value;
                    });
                  },
                )
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
                      .popAndPushNamed("/survey", arguments: 12);
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
                      .popAndPushNamed("/survey", arguments: 14);
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
