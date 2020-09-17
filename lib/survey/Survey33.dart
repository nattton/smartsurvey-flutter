import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBox.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputText.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber2.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey33 extends StatefulWidget {
  @override
  _Survey33State createState() => _Survey33State();
}

class _Survey33State extends State<Survey33> {
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
              '33. การอบรมอาชีพตามแนวทางสร้างสัมมาชีพชุมชน',
              style: MyFont.h1Font,
            ),
          ),
          ListTile(
            title: Text(
              '33.1 ในรอบปีที่ผ่านมาคนในครัวเรือนได้รับการอบรมอาชีพตามแนวทางสร้างสัมมาชีพชุมชน หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["63311"],
            onChanged: (String value) {
              setState(() {
                home.answer["63311"] = value;
              });
            },
          ),
          LabeledRadioInputNumber(
            label: 'มี ... คน',
            value: "1",
            groupValue: home.answer["63311"],
            question: "จำนวน",
            unit: "คน",
            onChanged: (String value) {
              setState(() {
                home.answer["63311"] = value;
              });
            },
          ),
          Visibility(
              visible: home.answer["63311"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '33.2 สมาชิกในครัวเรือนได้รับการฝึกอบรมอาชีพตามแนวทางสร้างสัมมาชีพชุมชน และนำความรู้ไปใช้ประโยชน์ในการประกอบอาชีพอย่างไร',
                      style: MyFont.h2Font,
                    ),
                  ),
                  LabeledCheckBoxInputNumber(
                    label: 'นำความรู้ไปพัฒนาต่อยอดอาชีพเดิม ... คน',
                    groupValue: home.answer["63321"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["63321"] = value;
                      });
                    },
                  ),
                  LabeledCheckBoxInputNumber(
                    label: 'นำความรู้ไปพัฒนาต่อยอดอาชีพใหม่ ... คน',
                    groupValue: home.answer["63322"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["63322"] = value;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ทำนา',
                    value: "1",
                    groupValue: home.answer["63323"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63323"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ทำไร่',
                    value: "1",
                    groupValue: home.answer["63324"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63324"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ทำสวน',
                    value: "1",
                    groupValue: home.answer["63325"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63325"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ประมง',
                    value: "1",
                    groupValue: home.answer["63326"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63326"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ปศุสัตว์',
                    value: "1",
                    groupValue: home.answer["63327"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63327"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ค้าขาย',
                    value: "1",
                    groupValue: home.answer["63328"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63328"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'รับจ้างใช้แรงงาน',
                    value: "1",
                    groupValue: home.answer["63329"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["63329"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'บริการ',
                    value: "1",
                    groupValue: home.answer["633210"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["633210"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBox(
                    label: 'ธุรกิจส่วนตัว',
                    value: "1",
                    groupValue: home.answer["633211"],
                    onChanged: (String newValue) {
                      setState(() {
                        home.answer["633211"] = newValue;
                      });
                    },
                  ),
                  LabeledCheckBoxInputText(
                    label: 'อื่น ๆ (ระบุ) ....',
                    groupValue: home.answer["633212"],
                    question: "อื่น ๆ (ระบุ)",
                    unit: "",
                    value: "1",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["633212"] = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      '33.3 รายได้จากการประกอบสัมมาชีพชุมชน ตามข้อ 33.2',
                      style: MyFont.h2Font,
                    ),
                  ),
                  LabeledRadio(
                    label: 'ไม่มีรายได้',
                    value: "0",
                    groupValue: home.answer["63331"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["63331"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'มีรายได้ จำนวน ... บาท',
                    value: "1",
                    groupValue: home.answer["63331"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["63331"] = value;
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
                      .popAndPushNamed("/survey", arguments: 32);
                },
              ),
              SizedBox(width: 20.0),
              PillShapedButton(
                title: "ส่งคำตอบ",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/satisfaction");
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
