import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/my_font.dart';
import 'package:smartsurveys/widget/labeled_radio.dart';

class Survey2 extends StatefulWidget {
  @override
  _Survey2State createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
  String _a1211 = "";
  String _a1221 = "";
  String _a1231 = "";
  String _a1241 = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
              '2. เด็กแรกเกิดได้กินนมแม่อย่างเดียวอย่างน้อย 6 เดือนแรกติดต่อกัน',
              style: MyFont.h1Font),
        ),
        ListTile(
          title: Text(
            '2.1 ครัวเรือนนี้ มีเด็กอายุน้อยกว่า 6 เดือน หรือไม่',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'มี ... คน',
          value: "1",
          groupValue: _a1211,
          onChanged: (String value) {
            setState(() {
              _a1211 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่มี (ข้ามไปข้อ 2.3)',
          value: "0",
          groupValue: _a1211,
          onChanged: (String value) {
            setState(() {
              _a1211 = value;
            });
          },
        ),
        ListTile(
          title: Text(
            '2.2 เด็กอายุน้อยกว่า 6 เดือน ได้กินนมแม่อย่างเดียว ตั้งแต่แรกเกิดเป็นเวลาติดต่อกันจนถึงวันที่สำรวจทุกคน หรือไม่',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'ทุกคน',
          value: "1",
          groupValue: _a1221,
          onChanged: (String value) {
            setState(() {
              _a1221 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่ได้กิน ... คน',
          value: "0",
          groupValue: _a1221,
          onChanged: (String value) {
            setState(() {
              _a1221 = value;
            });
          },
        ),
        ListTile(
          title: Text(
            '2.3 ครัวเรือนนี้ มีเด็กอายุตั้งแต่ 6 เดือน ถึง 1 ปี หรือไม่',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'มี ... คน',
          value: "1",
          groupValue: _a1231,
          onChanged: (String value) {
            setState(() {
              _a1231 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่มี (ข้ามไปข้อ 3)',
          value: "0",
          groupValue: _a1231,
          onChanged: (String value) {
            setState(() {
              _a1231 = value;
            });
          },
        ),
        ListTile(
          title: Text(
            '2.4 เด็กอายุตั้งแต่ 6 เดือนถึง 1 ปี ได้กินนมแม่อย่างเดียว เป็นระยะเวลา 6 เดือนแรกติดต่อกัน ทุกคน หรือไม่',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'ทุกคน',
          value: "1",
          groupValue: _a1241,
          onChanged: (String value) {
            setState(() {
              _a1241 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่ได้กิน ... คน',
          value: "0",
          groupValue: _a1241,
          onChanged: (String value) {
            setState(() {
              _a1241 = value;
            });
          },
        ),
      ],
    );
  }
}
