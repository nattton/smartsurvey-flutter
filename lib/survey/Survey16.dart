import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledCheckBoxInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey16 extends StatefulWidget {
  @override
  _Survey16State createState() => _Survey16State();
}

class _Survey16State extends State<Survey16> {
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
    int count6to14 = home.countMemberAgeRange(6, 14);
    home.answer["31611"] = count6to14 > 0 ? "1,$count6to14" : "0";
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('16. เด็กอายุ 6 - 14 ปี ได้รับการศึกษาภาคบังคับ 9 ปี',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '16.1 ครัวเรือนนี้ มีเด็กอายุ 6 - 14 ปี หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count6to14 คน',
            value: "1,$count6to14",
            groupValue: home.answer["31611"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 17)',
            value: "0",
            groupValue: home.answer["31611"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: home.answer["31611"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '16.2 เด็กอายุ 6 - 14 ปี ได้เข้าเรียน ชั้น ป.1 - ม.3 (การศึกษาภาคบังคับ 9 ปี) ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้เรียนทุกคน',
                    value: "1",
                    groupValue: home.answer["31621"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31621"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้เรียน ... คน',
                    value: "0",
                    groupValue: home.answer["31621"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31621"] = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                        '16.3 เด็กที่ได้เรียนชั้น ป.1 - ม.3 มีการออกกลางคัน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadioInputNumber(
                    label: 'มี ... คน',
                    value: "1",
                    groupValue: home.answer["31631"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31631"] = value;
                      });
                    },
                  ),
                  LabeledRadio(
                    label: 'ไม่มี (ข้ามไปข้อ 16.5)',
                    value: "0",
                    groupValue: home.answer["31631"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31631"] = value;
                      });
                    },
                  ),
                  Visibility(
                    visible: home.answer["31631"] != "0",
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('16.4 เด็กที่ออกกลางคันไปทำอะไร',
                              style: MyFont.h2Font),
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'เรียนต่อ กศน/การศึกษาผู้ใหญ่ ... คน',
                          groupValue: home.answer["31641"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31641"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'ศึกษาเองที่บ้าน (โฮมสคูล) ... คน',
                          groupValue: home.answer["31642"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31642"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'เรียนต่อต่างประเทศ ... คน',
                          groupValue: home.answer["31643"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31643"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'ไม่ได้เรียนต่อแต่ทำงาน ... คน',
                          groupValue: home.answer["31644"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31644"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'ไม่ได้เรียนต่อและไม่ได้ทำงาน ... คน',
                          groupValue: home.answer["31645"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31645"] = value;
                            });
                          },
                        ),
                        ListTile(
                          title: Text(
                              '16.5 เด็กอายุ 6 - 14 ปี มีความสนใจในการหาความรู้จากสื่อต่างๆ เช่น การอ่านหนังสือ การดูข่าวสาร สารคดี การใช้อินเตอร์เน็ตเพื่อหาความรู้ เป็นต้น โดยเฉลี่ยกี่ชั่วโมงต่อสัปดาห์',
                              style: MyFont.h2Font),
                        ),
                        LabeledCheckBoxInputNumber(
                          label: '... ชั่วโมง/สัปดาห์',
                          groupValue: home.answer["31651"],
                          question: "จำนวน",
                          unit: "ชั่วโมง/สัปดาห์",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31651"] = value;
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
                      .popAndPushNamed("/survey", arguments: 15);
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
                      .popAndPushNamed("/survey", arguments: 17);
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
