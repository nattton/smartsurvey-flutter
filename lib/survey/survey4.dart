import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/widgets/labeled_radio.dart';

class Survey4 extends StatefulWidget {
  @override
  _Survey4State createState() => _Survey4State();
}

class _Survey4State extends State<Survey4> {
  String _a1111 = "";
  String _a1112 = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('4. ครัวเรือนกินอาหารถูกสุขลักษณะ ปลอดภัย และได้มาตรฐาน',
              style: MyFont.h1Font),
        ),
        ListTile(
          title: Text(
            '4.1 ถ้ากินอาหารบรรจุสำเร็จ ต้องมีเครื่องหมาย อย. เช่น เกลือเสริมไอโอดีน น้ำปลา น้ำส้มสายชู อาหารกระป๋อง นม อาหารกล่อง เป็นต้น',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'ใช่',
          value: "1",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่ใช่',
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
            '4.2 ถ้ากินเนื้อสัตว์ต้องทำให้สุกด้วยความร้อน',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'ใช่',
          value: "1",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่ใช่',
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
            '4.3 ถ้ากินผักต้องเป็นผักปลอดสารพิษหรือได้ทำการแช่ด้วยน้ำผสมด่างทับทิมหรือน้ำยาล้างผักแล้วล้างด้วยน้ำสะอาดหลาย ๆ ครั้ง',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'ใช่',
          value: "1",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่ใช่',
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
            '4.4 ก่อนกินอาหารต้องล้างมือทุกครั้งและใช้ช้อนกลาง',
            style: MyFont.h2Font,
          ),
        ),
        LabeledRadio(
          label: 'ใช่',
          value: "1",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่ใช่',
          value: "0",
          groupValue: _a1111,
          onChanged: (String value) {
            setState(() {
              _a1111 = value;
            });
          },
        ),
      ],
    );
  }
}
