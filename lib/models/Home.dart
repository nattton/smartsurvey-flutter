import 'package:smartsurveys/models/Member.dart';

class Home {
  int id;
  bool valid = false;
  bool startSurvey = false;
  String photoSignature;
  String community;
  String hid;
  String hnum;
  String hname;
  String haddr;
  String htumbon;
  String hamphur;
  String hprovince;
  String harea;
  String hlive;
  String hjob;
  int satisfaction;
  String latitude;
  String longitude;
  List<Member> hmember;
  Map<String, String> answer;
  Home(this.id, {this.hid, this.community, this.answer});
}
