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

class Survey17 extends StatefulWidget {
  @override
  _Survey17State createState() => _Survey17State();
}

class _Survey17State extends State<Survey17> {
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
    int count14to17 = home.countMemberAgeRange(14, 17);
    int count15to18 = home.countMemberAgeRange(15, 18);
    int count15to25 = home.countMemberAgeRange(15, 25);
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('17. เด็กจบชั้น ม.3 ได้เรียนต่อชั้น ม.4 หรือเทียบเท่า',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '17.1 ในรอบปีที่ผ่านมา ครัวเรือนนี้ มีเด็กจบชั้น ม.3 หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadioInputNumber(
            label: 'มี ... คน',
            value: "1",
            question: "จำนวน",
            unit: "คน",
            groupValue: home.answer["31711"],
            onChanged: (String value) {
              if (count14to17 > 0) {
                setState(() {
                  home.answer["31711"] = value;
                });
              }
            },
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 17.5)',
            value: "0",
            groupValue: home.answer["31711"],
            onChanged: (String value) {
              setState(() {
                home.answer["31711"] = value;
              });
            },
          ),
          Visibility(
              visible: home.answer["31711"] != "0",
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '17.2 เด็กจบชั้น ม.3 ได้เรียนต่อชั้น ม.4 หรือเทียบเท่า ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ได้เรียนทุกคน',
                    value: "1",
                    groupValue: home.answer["31721"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31721"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'ไม่ได้เรียน ... คน',
                    value: "0",
                    groupValue: home.answer["31721"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31721"] = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                        '17.3 เด็กที่ได้เรียนต่อชั้น ม.4 หรือเทียบเท่า มีการออกกลางคัน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadioInputNumber(
                    label: 'มี ... คน',
                    value: "1",
                    groupValue: home.answer["31731"],
                    question: "จำนวน",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31731"] = value;
                      });
                    },
                  ),
                  LabeledRadio(
                    label: 'ไม่มี (ข้ามไปข้อ 17.5)',
                    value: "0",
                    groupValue: home.answer["31731"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["31731"] = value;
                      });
                    },
                  ),
                  Visibility(
                    visible: home.answer["31731"] != "0",
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('17.4 เด็กที่ออกกลางคันไปทำอะไร',
                              style: MyFont.h2Font),
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'เรียนต่อ กศน/การศึกษาผู้ใหญ่ ... คน',
                          groupValue: home.answer["31741"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31741"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'ศึกษาเองที่บ้าน (โฮมสคูล) ... คน',
                          groupValue: home.answer["31742"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31742"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'เรียนต่อต่างประเทศ ... คน',
                          groupValue: home.answer["31743"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31743"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'ไม่ได้เรียนต่อแต่ทำงาน ... คน',
                          groupValue: home.answer["31744"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31744"] = value;
                            });
                          },
                        ),
                        LabeledCheckBoxInputNumber(
                          label: 'ไม่ได้เรียนต่อและไม่ได้ทำงาน ... คน',
                          groupValue: home.answer["31745"],
                          question: "จำนวน",
                          unit: "คน",
                          onChanged: (String value) {
                            setState(() {
                              home.answer["31745"] = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Visibility(
            visible: count15to18 > 0,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      '16.5 เด็กอายุ 15 - 18 ปี มีความสนใจในการหาความรู้จากสื่อต่างๆ เช่น การอ่านหนังสือ การดูข่าวสาร สารคดี การใช้อินเตอร์เน็ตเพื่อหาความรู้ เป็นต้น โดยเฉลี่ยกี่ชั่วโมงต่อสัปดาห์',
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
          ),
          Visibility(
            visible: count15to25 > 0,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      '17.6 เด็กอายุ 15 – 25 ปี มีความสนใจเป็นเยาวชน OTOP (Young OTOP) หรือไม่ (Young OTOP คือ เยาวชนคนรุ่นใหม่ที่สนใจเข้ามามีส่วนหนึ่งในการอนุรักษ์และสืบสานภูมิปัญญาท้องถิ่น สามารถนำภูมิปัญญาท้องถิ่นมาสร้างให้เกิดมูลค่า เกิดการพัฒนาอาชีพ สร้างงาน สร้างรายได้ และมีเป้าหมายในการพัฒนาให้เป็นผู้ประกอบการ OTOP รุ่นใหม่ที่มีศักยภาพ)',
                      style: MyFont.h2Font),
                ),
                LabeledRadioInputNumber(
                  label: 'สนใจ ... คน',
                  value: "1",
                  groupValue: home.answer["31761"],
                  question: "จำนวน",
                  unit: "คน",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["31761"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ไม่สนใจ',
                  value: "0",
                  groupValue: home.answer["31761"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["31761"] = value;
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
                      .popAndPushNamed("/survey", arguments: 16);
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
                      .popAndPushNamed("/survey", arguments: 18);
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
