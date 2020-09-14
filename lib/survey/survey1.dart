import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey1 extends StatefulWidget {
  @override
  _Survey1State createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  SurveyApp app;
  Home home;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);
    home = app.currentHome;
    int count = home.countMemberAgeLessThan1Year();
    home.answer["1111"] = count > 0 ? "1,$count" : "0";
    bool _visible = count > 0;
    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('1. เด็กแรกเกิดมีน้ำหนัก 2,500 กรัม ขึ้นไป',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '1.1 ครัวเรือนนี้ มีเด็กอายุไม่เกิน 1 ปี หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          LabeledRadio(
            label: 'มี $count คน',
            value: "1,$count",
            groupValue: home.answer["1111"],
            onChanged: (String value) {},
          ),
          LabeledRadio(
            label: 'ไม่มี (ข้ามไปข้อ 3)',
            value: "0",
            groupValue: home.answer["1111"],
            onChanged: (String value) {},
          ),
          Visibility(
              visible: _visible,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '1.2 เด็กอายุไม่เกิน 1 ปี มีน้ำหนักแรกเกิด ไม่น้อยกว่า 2,500 กรัม ทุกคน หรือไม่',
                        style: MyFont.h2Font),
                  ),
                  LabeledRadio(
                    label: 'ทุกคน',
                    value: "1",
                    groupValue: home.answer["1121"],
                    onChanged: (String value) {
                      setState(() {
                        home.answer["1121"] = value;
                      });
                    },
                  ),
                  LabeledRadioInputNumber(
                    label: 'น้อยกว่า ... คน',
                    value: "0",
                    groupValue: home.answer["1121"],
                    question: "น้อยกว่า",
                    unit: "คน",
                    onChanged: (String value) {
                      setState(() {
                        home.answer["1121"] = value;
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
                title: "ถัดไป",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context)
                      .popAndPushNamed("/survey", arguments: _visible ? 2 : 3);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
