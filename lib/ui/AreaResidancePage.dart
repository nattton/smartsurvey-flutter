import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Family.dart';

class AreaResidancePage extends StatefulWidget {
  final Family family;
  AreaResidancePage({key, this.family}) : super(key: key);

  @override
  _AreaResidancePageState createState() =>
      _AreaResidancePageState(family: family);
}

class _AreaResidancePageState extends State<AreaResidancePage> {
  final Family family;
  _AreaResidancePageState({this.family});
  final _biggerFont = const TextStyle(fontSize: 18.0);

  String _arealive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ที่พักอาศัยตั้งอยู่บน'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgimage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: MyFont.colorBG,
              borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
          child: ListView(
            children: [
              SizedBox(height: 16.0),
              Row(children: [
                Radio(
                    value: "1",
                    groupValue: _arealive,
                    onChanged: (newValue) {
                      setState(() {
                        _arealive = newValue;
                      });
                      _selectSelfArea(context, newValue);
                    }),
                Text("ที่ดินตนเอง")
              ]),
              Row(children: [
                Radio(
                    value: "2",
                    groupValue: _arealive,
                    onChanged: (newValue) {
                      setState(() {
                        _arealive = newValue;
                      });
                    }),
                Text("เช่า")
              ]),
              Row(children: [
                Radio(
                    value: "3",
                    groupValue: _arealive,
                    onChanged: (newValue) {
                      setState(() {
                        _arealive = newValue;
                      });
                    }),
                Text("ที่สาธารณะ")
              ]),
              Row(children: [
                Radio(
                    value: "4",
                    groupValue: _arealive,
                    onChanged: (newValue) {
                      setState(() {
                        _arealive = newValue;
                      });
                    }),
                Text("อื่น ๆ ระบุ")
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void _selectSelfArea(BuildContext context, String value) {
    TextEditingController rai;
    TextEditingController wah;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("ที่ดินตนเอง"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 140,
                        child: TextField(
                            controller: rai,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'จำนวน',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ])),
                    SizedBox(width: 8.0),
                    Flexible(child: Text("ไร่")),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    SizedBox(
                        width: 140,
                        child: TextField(
                            controller: rai,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'จำนวน',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ])),
                    SizedBox(width: 8.0),
                    Flexible(child: Text("ตารางวา")),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _arealive = null;
                        });
                      },
                      child: Text("ออก")),
                  FlatButton(
                      child: Text("บันทึก"),
                      onPressed: () {
                        setState(() {
                          family.hlive = "$value,${rai.text},${wah.text}";
                          Navigator.of(context).pushNamed("/surveygroup",
                              arguments: {'family': family});
                        });
                      })
                ],
              )
            ],
          );
        });
  }
}
