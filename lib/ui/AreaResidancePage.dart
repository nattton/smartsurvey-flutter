import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/LandRights.dart';

class AreaResidancePage extends StatefulWidget {
  final Home home;
  AreaResidancePage({key, this.home}) : super(key: key);

  @override
  _AreaResidancePageState createState() => _AreaResidancePageState(home: home);
}

class _AreaResidancePageState extends State<AreaResidancePage> {
  final Home home;
  _AreaResidancePageState({this.home});

  QueryCtr _query = QueryCtr();
  List<LandRights> _landRights = [];
  String _arealive;

  LandRights _landRight;

  TextEditingController _raiController = TextEditingController();
  TextEditingController _wahController = TextEditingController();
  TextEditingController _otherController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _query.getAllLandRights().then((value) {
      setState(() {
        _landRights = value;
      });
    });
  }

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
                      _selectSelfArea(context);
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
                      _selectArea(context, "เช่า", "2");
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
                      _selectArea(context, "ที่สาธารณะ", "3");
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
                      _selectOtherArea(context);
                    }),
                Text("อื่น ๆ ระบุ")
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void _selectSelfArea(BuildContext context) {
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
                            controller: _raiController,
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
                            controller: _wahController,
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
                              FilteringTextInputFormatter.digitsOnly,
                            ])),
                    SizedBox(width: 8.0),
                    Flexible(child: Text("ตารางวา")),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                          width: 1.0)),
                  child: DropdownButton<LandRights>(
                    isExpanded: true,
                    hint: Text("ประเภทเอกสารสิทธิ์"),
                    underline: Container(),
                    items: _landRights
                        .map<DropdownMenuItem<LandRights>>((LandRights p) {
                      return DropdownMenuItem<LandRights>(
                        value: p,
                        child: Text(
                          p.codename,
                          overflow: TextOverflow.clip,
                        ),
                      );
                    }).toList(),
                    onChanged: (LandRights newValue) {
                      setState(() {
                        _landRight = newValue;
                        Navigator.of(context).pop();
                        _selectSelfArea(context);
                      });
                    },
                    value: _landRight,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _arealive = null;
                        });
                      },
                      child: Text("ออก")),
                  TextButton(
                      child: Text("บันทึก"),
                      onPressed: () {
                        if (_raiController.text == "" ||
                            _raiController.text == "" ||
                            _landRight == null) {
                          return;
                        }

                        setState(() {
                          home.hlive =
                              "1,${_raiController.text},${_wahController.text},{$_landRight.code}";
                          Navigator.of(context)
                              .pushNamed("/areacareer", arguments: home);
                        });
                      })
                ],
              )
            ],
          );
        });
  }

  void _selectArea(BuildContext context, String title, String value) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 140,
                        child: TextField(
                            controller: _raiController,
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
                            controller: _wahController,
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
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _arealive = null;
                        });
                      },
                      child: Text("ออก")),
                  TextButton(
                      child: Text("บันทึก"),
                      onPressed: () {
                        if (_raiController.text == "" ||
                            _raiController.text == "") {
                          return;
                        }

                        setState(() {
                          home.hlive =
                              "$value,${_raiController.text},${_wahController.text}";
                          Navigator.of(context)
                              .pushNamed("/areacareer", arguments: home);
                        });
                      })
                ],
              )
            ],
          );
        });
  }

  void _selectOtherArea(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("อื่น ๆ"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _otherController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'ระบุข้อมูลอื่น ๆ',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    SizedBox(
                        width: 140,
                        child: TextField(
                            controller: _raiController,
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
                            controller: _wahController,
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
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _arealive = null;
                        });
                      },
                      child: Text("ออก")),
                  TextButton(
                      child: Text("บันทึก"),
                      onPressed: () {
                        if (_raiController.text == "" ||
                            _raiController.text == "") {
                          return;
                        }

                        setState(() {
                          home.hlive =
                              "4,${_raiController.text},${_wahController.text},${_otherController.text}";
                          Navigator.of(context)
                              .pushNamed("/areacareer", arguments: home);
                        });
                      })
                ],
              )
            ],
          );
        });
  }
}
