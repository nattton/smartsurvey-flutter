import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/my_font.dart';
import 'package:smartsurveys/widget/labeled_radio.dart';

class Survey5 extends StatefulWidget {
  @override
  _Survey5State createState() => _Survey5State();
}

class _Survey5State extends State<Survey5> {
  String _a1111 = "";
  String _a1112 = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('5. ครัวเรือนมีการใช้ยาเพื่อบำบัด บรรเทาอาการเจ็บป่วยเบื้องต้นอย่างเหมาะสม', style: MyFont.h1Font),
        ),
        ListTile(
          title: Text('5.1 ใช้ยาสามัญประจำบ้าน', style: MyFont.h2Font,),
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
          title: Text('5.2 ไม่กินยาชุดที่ซื้อจากร้านขายของชำ', style: MyFont.h2Font,),
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
          title: Text('5.3 ไม่กินยาสมุนไพรหรือยาแผนโบราณที่ไม่ได้ปรับปรุงขึ้นเฉพาะสำหรับตน (ยกเว้นยาสามัญประจำบ้านแผนโบราณ)', style: MyFont.h2Font,),
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
          title: Text('5.4 ไม่กินผลิตภัณฑ์เสริมอาหารที่อวดอ้างสรรพคุณเกินจริง โดยแสดงสรรพคุณเป็นยาเพื่อบำบัด บรรเทา รักษาโรค ซึ่งไม่ตรงกับที่แสดงในฉลาก', style: MyFont.h2Font,),
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
