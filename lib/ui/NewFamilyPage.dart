import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/Amphur.dart';
import 'package:smartsurveys/models/Community.dart';
import 'package:smartsurveys/models/CommunityAPI.dart';
import 'package:smartsurveys/models/Prefix.dart';
import 'package:smartsurveys/models/Province.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/models/Tumbon.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/labeled_radio.dart';

class NewFamilyPage extends StatefulWidget {
  final CommunityAPI cm;
  const NewFamilyPage({Key key, this.cm}) : super(key: key);
  @override
  _NewFamilyPageState createState() => _NewFamilyPageState();
}

class _NewFamilyPageState extends State<NewFamilyPage> {
  final CommunityAPI cm;
  _NewFamilyPageState({this.cm});

  QueryCtr _query = QueryCtr();

  List<Province> _provinces = [];
  List<Amphur> _amphurs = [];
  List<Tumbon> _tumbons = [];
  List<Community> _communities = [];

  Prefix _prefix;
  Province _province;
  Amphur _amphur;
  Tumbon _tumbon;
  Community _community;

  bool _hasHomeNo = true;
  String _labelHomeNo = "เลขที่";
  final TextEditingController _homeNoController = TextEditingController();
  final TextEditingController _soiController = TextEditingController();
  final TextEditingController _roadController = TextEditingController();
  final TextEditingController _mooController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _query.getAllProvinces().then((value) {
      setState(() {
        _provinces = value;
      });
    });
  }

  void _reloadAmphurs(String provinceCode) {
    _query.getAllAmphurs(provinceCode).then((value) {
      setState(() {
        _amphurs = value;
      });
    });
  }

  void _reloadTumbons(String amphurCode) {
    _query.getAllTumbons(amphurCode).then((value) {
      setState(() {
        _tumbons = value;
      });
    });
  }

  void _reloadCommunities(String tumbonCode) {
    _query.getAllCommunities(tumbonCode).then((value) {
      setState(() {
        _communities = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ที่อยู่ของครัวเรือน'),
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
          child: Center(
            child: ListView(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              shrinkWrap: false,
              children: <Widget>[
                SizedBox(height: 16.0),
                LabeledRadio(
                  label: 'มีเลขที่บ้าน',
                  value: true,
                  groupValue: _hasHomeNo,
                  onChanged: (value) {
                    setState(() {
                      _hasHomeNo = value;
                      _labelHomeNo = "เลขที่";
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ไม่มีเลขที่บ้าน',
                  value: false,
                  groupValue: _hasHomeNo,
                  onChanged: (value) {
                    setState(() {
                      _hasHomeNo = value;
                      _labelHomeNo = "เลขที่บ้านใกล้เคียง";
                    });
                  },
                ),
                Visibility(
                  visible: _hasHomeNo,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 140,
                          child: TextField(
                              maxLength: 4,
                              controller: _roadController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'รหัสครอบครัว',
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
                      Flexible(
                          child: TextField(
                              maxLength: 7,
                              controller: _roadController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'รหัสประจำบ้าน',
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
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _homeNoController,
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: _labelHomeNo,
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 24.0),
                TextField(
                  controller: _soiController,
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: 'ซอย',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),
                SizedBox(height: 24.0),
                TextField(
                  controller: _roadController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'ถนน',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                SizedBox(height: 12.0),
                _decorateDropdown(_dropdownProvince()),
                SizedBox(height: 24.0),
                _decorateDropdown(_dropdownAmphur()),
                SizedBox(height: 24.0),
                _decorateDropdown(_dropdownTumbon()),
                SizedBox(height: 24.0),
                TextField(
                    maxLength: 3,
                    controller: _mooController,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'หมู่',
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
                    ]),
                SizedBox(height: 24.0),
                _decorateDropdown(_dropdownCommunity()),
                SizedBox(height: 24.0),
                PillShapedButton(
                  title: "ถัดไป",
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/surveygroup");
                  },
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _decorateDropdown(Widget dropdown) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
              color: Color.fromRGBO(112, 112, 112, 1.0), width: 1.0)),
      child: dropdown, //DropDownButton
    );
  }

  Widget _dropdownProvince() {
    return DropdownButton<Province>(
      hint: Text("จังหวัด"),
      underline: Container(),
      items: _provinces.map<DropdownMenuItem<Province>>((Province p) {
        return DropdownMenuItem<Province>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Province newValue) {
        setState(() {
          this._community = null;
          this._tumbon = null;
          this._amphur = null;
          this._province = newValue;
          _reloadAmphurs(this._province.code);
        });
      },
      value: _province,
    );
  }

  Widget _dropdownAmphur() {
    return DropdownButton<Amphur>(
      hint: Text("อำเภอ"),
      underline: Container(),
      items: _amphurs.map<DropdownMenuItem<Amphur>>((Amphur p) {
        return DropdownMenuItem<Amphur>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Amphur newValue) {
        setState(() {
          this._community = null;
          this._tumbon = null;
          this._amphur = newValue;
          _reloadTumbons(this._amphur.code);
        });
      },
      value: _amphur,
    );
  }

  Widget _dropdownTumbon() {
    return DropdownButton<Tumbon>(
      hint: Text("ตำบล"),
      underline: Container(),
      items: _tumbons.map<DropdownMenuItem<Tumbon>>((Tumbon p) {
        return DropdownMenuItem<Tumbon>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Tumbon newValue) {
        setState(() {
          this._community = null;
          this._tumbon = newValue;
          _reloadCommunities(_tumbon.code);
        });
      },
      value: _tumbon,
    );
  }

  Widget _dropdownCommunity() {
    return DropdownButton<Community>(
      hint: Text("หมู่บ้าน/ชุมชน"),
      underline: Container(),
      items: _communities.map<DropdownMenuItem<Community>>((Community p) {
        return DropdownMenuItem<Community>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Community newValue) {
        setState(() {
          this._community = newValue;
        });
      },
      value: _community,
    );
  }

  void _saveUserInfo(BuildContext context) async {
    if (_prefix == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกคำนำหน้า"),
            );
          });
      return;
    }

    if (_homeNoController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกชื่อ"),
            );
          });
      return;
    }

    if (_soiController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกนามสกุล"),
            );
          });
      return;
    }

    if (_roadController.text.length < 13) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกเลขบัตรประชาชนให้ถูกต้อง"),
            );
          });
      return;
    }

    if (_mooController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกเบอร์โทรศัพท์"),
            );
          });
      return;
    }

    if (_province == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกจังหวัด"),
            );
          });
      return;
    }

    if (_amphur == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกอำเภอ"),
            );
          });
      return;
    }

    if (_tumbon == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกตำบล"),
            );
          });
      return;
    }

    if (_community == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกชุมชน"),
            );
          });
      return;
    }
  }
}
