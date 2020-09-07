import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/widgets/labeled_radio.dart';

class Survey6 extends StatefulWidget {
  @override
  _Survey6State createState() => _Survey6State();
}

class _Survey6State extends State<Survey6> {
  String _a1111 = "";
  String _a1112 = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('6. คนอายุ 35 ปีขึ้นไป ได้รับการตรวจสุขภาพประจำปี',
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
          title: Text(
              '1.2 เด็กอายุไม่เกิน 1 ปี มีน้ำหนักแรกเกิด ไม่น้อยกว่า 2,500 กรัม ทุกคน หรือไม่',
              style: MyFont.h2Font),
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
