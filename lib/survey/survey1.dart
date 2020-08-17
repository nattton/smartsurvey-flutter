import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartsurveys/constants/my_font.dart';
import 'package:smartsurveys/model/family.dart';
import 'package:smartsurveys/widget/labeled_radio.dart';

class Survey1 extends StatefulWidget {
  @override
  _Survey1State createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<Family> _family;
  @override
  void initState() {
    super.initState();
    _family = _prefs.then((SharedPreferences prefs) {
      return prefs.get("family") ?? new Family();
    });
  }

  @override
  Widget build(BuildContext context) {
//    var f = await getFamily();
//    print(f);
//    setFamily('hello family');
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
          groupValue: _family.then((f) {return f.getAnswer("1111"); }),
          onChanged: (String value) {
            setState(() {
              _family.then((f) => {f.setAnswer("1111", value)});
            });
          },
        ),
        LabeledRadio(
          label: 'ไม่มี (ข้ามไปข้อ 3)',
          value: "0",
          groupValue: _family.then((f) {return f.getAnswer("1111"); }),

          onChanged: (String value) {
            setState(() {
              _family.then((f) => {f.setAnswer("1111", value)});
            });
          },
        ),
        ListTile(
          title: Text('1.2 เด็กอายุไม่เกิน 1 ปี มีน้ำหนักแรกเกิด ไม่น้อยกว่า 2,500 กรัม ทุกคน หรือไม่', style: MyFont.h2Font),
        ),
        LabeledRadio(
          label: 'ทุกคน',
          value: "1",
          groupValue: _family.then((f) => f.getAnswer("1112")),
          onChanged: (String value) {
            setState(() {
              _family.then((f) => {f.setAnswer("1112", value)});
            });
          },
        ),
        LabeledRadio(
          label: 'น้อยกว่า ... คน',
          value: "0",
          groupValue: _family.then((f) => f.getAnswer("1112")),
          onChanged: (String value) {
            setState(() {
              _family.then((f) => {f.setAnswer("1112", value)});
            });
          },
        ),
      ],
    );
  }

  Future<String> _read(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Family family = prefs.get("family") ?? Family();
    final ans = family.getAnswer(key);
    print("read: $key : $ans");
    return ans;
  }
  _save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    final Family family = prefs.getString("family") ?? Family();
    family.setAnswer(key, value);
    print('saved $value');
  }
}
