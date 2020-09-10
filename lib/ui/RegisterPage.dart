import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/data/AppService.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/Amphur.dart';
import 'package:smartsurveys/models/Community.dart';
import 'package:smartsurveys/models/Gender.dart';
import 'package:smartsurveys/models/Prefix.dart';
import 'package:smartsurveys/models/Province.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/models/Tumbon.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  QueryCtr _query = QueryCtr();
  List<Prefix> _prefixs = [];
  List<Gender> _genders = [];
  List<Province> _provinces = [];
  List<Amphur> _amphurs = [];
  List<Tumbon> _tumbons = [];
  List<Community> _communities = [];

  Prefix _prefix;
  Gender _gender;
  Province _province;
  Amphur _amphur;
  Tumbon _tumbon;
  Community _community;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  ByteData _img = ByteData(0);
  var color = Colors.black;
  var strokeWidth = 3.0;
  final _sign = GlobalKey<SignatureState>();

  @override
  void initState() {
    super.initState();
    _query.getAllPrefixs().then((value) {
      setState(() {
        _prefixs = value;
      });
    });
    _query.getAllGenders().then((value) {
      setState(() {
        _genders = value;
      });
    });

    _reloadProvinces();
  }

  void _reloadProvinces() {
    _query.getAllProvinces().then((value) {
      setState(() {
        _provinces = value;
      });
    });
  }

  void _reloadAmphurs(String provinceCode) {
    _query.getAmphurs(provinceCode).then((value) {
      setState(() {
        _amphurs = value;
      });
    });
  }

  void _reloadTumbons(String amphurCode) {
    _query.getTumbons(amphurCode).then((value) {
      setState(() {
        _tumbons = value;
      });
    });
  }

  void _reloadCommunities(String tumbonCode) {
    _query.getCommunities(tumbonCode).then((value) {
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
          title: Text('ลงทะเบียนผู้บันทึก'),
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
                borderRadius:
                    new BorderRadius.all(const Radius.circular(30.0))),
            child: Center(
              child: ListView(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                shrinkWrap: false,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  _decorateDropdown(_dropdownPrefix()),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: _firstNameController,
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: 'ชื่อ',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: _lastNameController,
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: 'นามสกุล',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                      maxLength: 13,
                      controller: _idCardController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'เลขประจำตัวประชาชน',
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
                  TextField(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2000, 5, 5, 20, 50),
                            maxTime: DateTime.now(), onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (date) {
                          var formatter = new DateFormat('dd/MM/');
                          _birthDateController.text =
                              formatter.format(date) + "${date.year + 543}";
                          print('confirm $date');
                        }, locale: LocaleType.th);
                      },
                      readOnly: true,
                      controller: _birthDateController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'วันเกิด',
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
                  _decorateDropdown(_dropdownGender()),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: _phoneController,
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: 'เบอร์โทรศัพท์',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: _addressController,
                    autofocus: false,
                    decoration: InputDecoration(
                        labelText: 'ที่อยู่',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                  SizedBox(height: 24.0),
                  _decorateDropdown(_dropdownProvince()),
                  SizedBox(height: 24.0),
                  _decorateDropdown(_dropdownAmphur()),
                  SizedBox(height: 24.0),
                  _decorateDropdown(_dropdownTumbon()),
                  SizedBox(height: 24.0),
                  _decorateDropdown(_dropdownCommunity()),
                  SizedBox(height: 24.0),
                  Text("กรุณลงลายมือชื่อด้านล่าง"),
                  GestureDetector(
                    child: Container(
                      child: _img.buffer.lengthInBytes == 0
                          ? Container(
                              height: 200.0,
                              color: Colors.white,
                            )
                          : LimitedBox(
                              maxHeight: 200.0,
                              child: Image.memory(_img.buffer.asUint8List())),
                    ),
                    onTap: () {
                      _signaturePad(context);
                    },
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: MyFont.colorBottomBar,
          child: Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PillShapedButton(
                  title: 'บันทึกข้อมูล',
                  color: Colors.orange,
                  onPressed: () => {_saveUserInfo(context)},
                ),
                SizedBox(width: 24.0),
                PillShapedButton(
                  title: 'ออกจากระบบ',
                  color: Colors.red,
                  onPressed: () async {
                    await app.logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (_) => false);
                  },
                ),
              ],
            ),
          ),
        ));
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

  Widget _dropdownPrefix() {
    return DropdownButton<Prefix>(
      hint: Text("คำนำหน้าชื่อ"),
      underline: Container(),
      items: _prefixs.map<DropdownMenuItem<Prefix>>((Prefix p) {
        return DropdownMenuItem<Prefix>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Prefix newValue) {
        setState(() {
          this._prefix = newValue;
        });
      },
      value: _prefix,
    );
  }

  Widget _dropdownGender() {
    return DropdownButton<Gender>(
      hint: Text("เพศ"),
      underline: Container(),
      items: _genders.map<DropdownMenuItem<Gender>>((Gender p) {
        return DropdownMenuItem<Gender>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Gender newValue) {
        setState(() {
          this._gender = newValue;
        });
      },
      value: _gender,
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

  void _signaturePad(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("กรุณลงลายมือชื่อด้านล่าง"),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: LimitedBox(
                    maxHeight: 200.0,
                    child: Signature(
                      color: color,
                      key: _sign,
                      onSign: () {
                        final sign = _sign.currentState;
                        debugPrint(
                            '${sign.points.length} points in the signature');
                      },
                      strokeWidth: strokeWidth,
                    ),
                  ),
                ),
                color: Colors.black12,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            final sign = _sign.currentState;
                            //retrieve image data, do whatever you want with it (send to server, save locally...)
                            final image = await sign.getData();
                            var data = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            sign.clear();
                            final encoded =
                                base64.encode(data.buffer.asUint8List());
                            setState(() {
                              _img = data;
                            });
                            debugPrint("onPressed " + encoded);
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Text("Save")),
                      MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            final sign = _sign.currentState;
                            sign.clear();
                            setState(() {
                              _img = ByteData(0);
                            });
                            debugPrint("cleared");
                          },
                          child: Text("Clear")),
                    ],
                  ),
                ],
              )
            ]),
          );
        });
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

    if (_firstNameController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกชื่อ"),
            );
          });
      return;
    }

    if (_lastNameController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกนามสกุล"),
            );
          });
      return;
    }

    if (_idCardController.text.length < 13) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกเลขบัตรประชาชนให้ถูกต้อง"),
            );
          });
      return;
    }

    if (_gender == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกเพศ"),
            );
          });
      return;
    }

    if (_birthDateController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกวันเกิด"),
            );
          });
      return;
    }

    if (_phoneController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกเบอร์โทรศัพท์"),
            );
          });
      return;
    }

    if (_addressController.text == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกที่อยู่"),
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

    if (_img.buffer.lengthInBytes == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาลงลายมือชื่อ"),
            );
          });
      return;
    }

    final app = Provider.of<SurveyApp>(context);
    final saveUserResponse = await AppService.saveUserInfo(
      app.user,
      _prefix.code,
      _firstNameController.text,
      _lastNameController.text,
      _idCardController.text,
      _phoneController.text,
      _gender.code,
      _birthDateController.text,
      _addressController.text,
      _province.code,
      _amphur.code,
      _tumbon.code,
      _community.code,
      base64.encode(_img.buffer.asUint8List()),
    );

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(saveUserResponse.message),
          );
        });
    if (saveUserResponse.status == 1) {
      final repo = app.storage;
      final username = await repo.getString("username");
      final password = await repo.getString("password");
      final user = await AppService.login(username, password);
      await repo.saveUser(user);

      if (user.activation == 1) {
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        Navigator.of(context).pushReplacementNamed("/register");
      }
    }
  }
}
