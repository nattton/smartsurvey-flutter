import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/my_font.dart';
import 'package:smartsurveys/widget/labeled_radio.dart';

class Survey1 extends StatefulWidget {
  @override
  _Survey1State createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  String _a1111 = "";
  String _a1112 = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('1. เด็กแรกเกิดมีน้ำหนัก 2,500 กรัม ขึ้นไป', style: MyFont.h1Font),
        ),
        ListTile(
          title: Text('1.1 ครัวเรือนนี้ มีเด็กอายุไม่เกิน 1 ปี หรือไม่', style: MyFont.h2Font,),
        ),
        LabeledRadio(
          label: 'มี ... คน',
          value: "1",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่มี (ข้ามไปข้อ 3)',
          value: "0",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
        ListTile(
          title: Text('1.2 เด็กอายุไม่เกิน 1 ปี มีน้ำหนักแรกเกิด ไม่น้อยกว่า 2,500 กรัม ทุกคน หรือไม่', style: MyFont.h2Font),
        ),
        LabeledRadio(
          label: 'ทุกคน',
          value: "1",
          groupValue: _a1112,
          onChanged: (String value) {
            setState(() {
              _a1112 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'น้อยกว่า ... คน',
          value: "0",
          groupValue: _a1112,
          onChanged: (String value) {
            setState(() {
              _a1112 = value;
            });
          },
        ),
      ],
    );
  }
}
