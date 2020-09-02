import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/widget/labeled_radio.dart';

class Survey1 extends StatefulWidget {
  @override
  _Survey1State createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  String _a1211 = "";

  @override
  Widget build(BuildContext context) {
//    var f = await getFamily();
//    print(f);
//    setFamily('hello family');
    return ListView(
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
          label: 'ไม่มี (ข้ามไปข้อ 3)',
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
              '1.2 เด็กอายุไม่เกิน 1 ปี มีน้ำหนักแรกเกิด ไม่น้อยกว่า 2,500 กรัม ทุกคน หรือไม่',
              style: MyFont.h2Font),
        ),
        LabeledRadio(
          label: 'ทุกคน',
          value: "1",
          groupValue: _a1211,
          onChanged: (String value) {
            setState(() {
              _a1211 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'น้อยกว่า ... คน',
          value: "0",
          groupValue: _a1211,
          onChanged: (String value) {
            setState(() {
              _a1211 = value;
            });
          },
        ),
      ],
    );
  }
}
