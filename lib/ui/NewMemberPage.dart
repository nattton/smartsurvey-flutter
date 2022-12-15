import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/Career.dart';
import 'package:smartsurveys/models/Education.dart';
import 'package:smartsurveys/models/Gender.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/Member.dart';
import 'package:smartsurveys/models/Prefix.dart';
import 'package:smartsurveys/models/Relationship.dart';
import 'package:smartsurveys/models/Religion.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';

class NewMemberPage extends StatefulWidget {
  final Home home;
  NewMemberPage({key, this.home}) : super(key: key);

  @override
  _NewMemberPageState createState() => _NewMemberPageState(home: home);
}

class _NewMemberPageState extends State<NewMemberPage> {
  final Home home;
  _NewMemberPageState({this.home});

  QueryCtr _query = QueryCtr();
  List<Prefix> _prefixs = [];
  List<Gender> _genders = [];
  List<Career> _carreers = [];
  List<Education> _educations = [];
  List<Religion> _religions = [];
  List<Relationship> _relationships = [];

  Prefix _prefix;
  Gender _gender;
  Career _carreer;
  Education _education;
  Religion _religion;
  Relationship _relationship;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  String _health = "";
  String _ability = "";
  String _informant = "";
  String _welfareCard = "";

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
    _query.getAllCareers().then((value) {
      setState(() {
        _carreers = value;
      });
    });
    _query.getAllEducations().then((value) {
      setState(() {
        _educations = value;
      });
    });
    _query.getAllReligions().then((value) {
      setState(() {
        _religions = value;
      });
    });
    _query.getAllRelationships().then((value) {
      setState(() {
        _relationships = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(home.noMember() ? 'เพิ่มหัวหน้าครัวเรือน' : 'เพิ่มสมาชิก'),
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
                SizedBox(height: 32.0),
                Text("ต้องเป็นข้อมูลสมาชิกที่อาศัยอยู่จริงในปัจจุบัน"),
                SizedBox(height: 24.0),
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
                _decorateDropdown(_dropdownGender()),
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
                          minTime: DateTime(DateTime.now().year - 120, 1, 1),
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
                      labelText: 'วัน/เดือน/ปีเกิด',
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
                _decorateDropdown(_dropdownCareer()),
                SizedBox(height: 24.0),
                _decorateDropdown(_dropdownEducation()),
                SizedBox(height: 24.0),
                _decorateDropdown(_dropdownReligion()),
                Visibility(
                    visible: !home.noMember(), child: SizedBox(height: 24.0)),
                Visibility(
                    visible: !home.noMember(),
                    child: _decorateDropdown(_dropdownRelationship())),
                SizedBox(height: 24.0),
                ListTile(
                  title: Text(
                    'สถานะภาพทางร่างการ',
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadio(
                  label: 'ปกติ',
                  value: "0",
                  groupValue: _health,
                  onChanged: (String value) {
                    setState(() {
                      _health = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'พิการ',
                  value: "1",
                  groupValue: _health,
                  onChanged: (String value) {
                    setState(() {
                      _health = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ผู้ป่วยเรื้อรัง',
                  value: "2",
                  groupValue: _health,
                  onChanged: (String value) {
                    setState(() {
                      _health = value;
                    });
                  },
                ),
                SizedBox(height: 24.0),
                ListTile(
                  title: Text(
                    'ช่วยเหลือตัวเอง',
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadio(
                  label: 'ได้',
                  value: "1",
                  groupValue: _ability,
                  onChanged: (String value) {
                    setState(() {
                      _ability = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'ไม่ได้',
                  value: "0",
                  groupValue: _ability,
                  onChanged: (String value) {
                    setState(() {
                      _ability = value;
                    });
                  },
                ),
                Visibility(
                  visible: home.hasInformant(),
                  child: Column(
                    children: [
                      SizedBox(height: 24.0),
                      ListTile(
                        title: Text(
                          'เป็นผู้ให้ข้อมูล',
                          style: MyFont.h2Font,
                        ),
                      ),
                      LabeledRadio(
                        label: 'เป็นผู้ให้ข้อมูล',
                        value: "1",
                        groupValue: _informant,
                        onChanged: (String value) {
                          setState(() {
                            _informant = value;
                          });
                        },
                      ),
                      LabeledRadio(
                        label: 'ไม่เป็นผู้ให้ข้อมูล',
                        value: "0",
                        groupValue: _informant,
                        onChanged: (String value) {
                          setState(() {
                            _informant = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                ListTile(
                  title: Text(
                    'บัตรสวัสดิการแห่งรัฐ',
                    style: MyFont.h2Font,
                  ),
                ),
                LabeledRadio(
                  label: 'มี',
                  value: "1",
                  groupValue: _welfareCard,
                  onChanged: (String value) {
                    _showWelfareCard();
                  },
                ),
                LabeledRadio(
                  label: 'ไม่มี',
                  value: "0",
                  groupValue: _welfareCard,
                  onChanged: (String value) {
                    setState(() {
                      _welfareCard = value;
                    });
                  },
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PillShapedButton(
                      title: 'บันทึก',
                      color: Colors.orange,
                      onPressed: () {
                        _saveMember(context);
                      },
                    ),
                    SizedBox(width: 24.0),
                    PillShapedButton(
                      title: 'ออก',
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
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

  Widget _dropdownCareer() {
    return DropdownButton<Career>(
      hint: Text("อาชีพ / อยู่ระหว่างการศึกษา"),
      underline: Container(),
      items: _carreers.map<DropdownMenuItem<Career>>((Career p) {
        return DropdownMenuItem<Career>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Career newValue) {
        setState(() {
          this._carreer = newValue;
        });
      },
      value: _carreer,
    );
  }

  Widget _dropdownEducation() {
    return DropdownButton<Education>(
      hint: Text("การศึกษา"),
      underline: Container(),
      items: _educations.map<DropdownMenuItem<Education>>((Education p) {
        return DropdownMenuItem<Education>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Education newValue) {
        setState(() {
          this._education = newValue;
        });
      },
      value: _education,
    );
  }

  Widget _dropdownReligion() {
    return DropdownButton<Religion>(
      hint: Text("ศาสนา"),
      underline: Container(),
      items: _religions.map<DropdownMenuItem<Religion>>((Religion p) {
        return DropdownMenuItem<Religion>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Religion newValue) {
        setState(() {
          this._religion = newValue;
        });
      },
      value: _religion,
    );
  }

  Widget _dropdownRelationship() {
    return DropdownButton<Relationship>(
      hint: Text("ความเกี่ยวข้องกับหัวหน้าครัวเรือน"),
      underline: Container(),
      items:
          _relationships.map<DropdownMenuItem<Relationship>>((Relationship p) {
        return DropdownMenuItem<Relationship>(
          value: p,
          child: Text(p.codename),
        );
      }).toList(),
      onChanged: (Relationship newValue) {
        setState(() {
          this._relationship = newValue;
        });
      },
      value: _relationship,
    );
  }

  void _saveMember(BuildContext context) async {
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

    if (_carreer == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกอาชีพหลัก"),
            );
          });
      return;
    }

    if (_education == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกการศึกษา"),
            );
          });
      return;
    }

    if (_religion == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณากรอกศาสนา"),
            );
          });
      return;
    }

    if (home.countMember() > 0 && _relationship == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกความเกี่ยวข้องกับหัวหน้าครัวเรือน"),
            );
          });
      return;
    }

    if (_health == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("กรุณาเลือกสถานะทางร่างกาย"),
            );
          });
      return;
    }

    if (_health == "") {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("สามารถช่วยเหลือตัวเองได้ ?"),
            );
          });
      return;
    }

    Member member = new Member();
    member.prefix = _prefix.code;
    member.prefixName = _prefix.codename;
    member.firstname = _firstNameController.text;
    member.lastname = _lastNameController.text;
    member.gender = _gender.code;
    member.idcard = _idCardController.text;
    member.birthdate = _birthDateController.text;
    member.jobname = _carreer.code;
    member.education = _education.code;
    member.religion = _religion.code;
    if (_relationship != null) member.relation = _relationship.code;
    member.jobname = _carreer.code;
    member.health = _health;
    member.ability = _ability;
    member.informant = _informant;
    member.welfareCard = _welfareCard;

    home.hmember.add(member);

    final app = Provider.of<SurveyApp>(context, listen: false);
    final repo = app.storage;
    await repo.addToWaiting(home);
    Navigator.of(context).pop();
  }

  _showWelfareCard() {
    setState(() {
      _welfareCard = "1";
    });
  }
}
