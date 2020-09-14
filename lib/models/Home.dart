import 'package:smartsurveys/models/Member.dart';

class Home {
  int id = 0;
  String hid;
  String hnum;
  String hname;
  String haddr;
  String htumbon;
  String hamphur;
  String hprovince;
  String community;
  String harea;
  String hlive;
  String hjob;
  int satisfaction;
  String latitude;
  String longitude;
  String photoSignature;
  List<Member> hmember = [];
  Map<String, String> answer = {
    "1111": "",
    "1121": "",
    "1211": "",
    "1221": "",
    "1231": "",
    "1241": "",
    "1311": "",
    "1321": "",
    "1331": "",
    "1332": "",
    "1333": "",
    "1334": "",
    "1335": "",
    "1336": "",
    "1337": "",
    "1338": "",
    "1339": "",
    "13310": "",
    "13311": "",
    "13312": "",
    "1411": "",
    "1421": "",
    "1431": "",
    "1441": "",
    "1511": "",
    "1521": "",
    "1531": "",
    "1541": "",
    "1611": "",
    "1612": "",
    "1613": "",
    "1614": "",
    "1615": "",
    "1621": "",
    "1622": "",
    "1623": "",
    "1624": "",
    "1625": "",
    "1631": "",
    "1641": "",
    "1651": "",
    "1711": "",
    "1712": "",
    "1713": "",
    "1714": "",
    "2811": "",
    "2821": "",
    "2911": "",
    "21011": "",
    "21111": "",
    "21121": "",
    "21131": "",
    "21141": "",
    "21151": "",
    "21152": "",
    "21153": "",
    "21154": "",
    "21161": "",
    "21171": "",
    "21181": "",
    "21211": "",
    "21221": "",
    "21231": "",
    "21241": "",
    "21251": "",
    "21261": "",
    "21271": "",
    "21311": "",
    "21312": "",
    "21313": "",
    "21314": "",
    "21321": "",
    "213221": "",
    "213222": "",
    "213223": "",
    "213224": "",
    "213225": "",
    "213226": "",
    "21331": "",
    "21411": "",
    "21421": "",
    "21431": "",
    "21451": "",
    "21461": "",
    "31511": "",
    "31521": "",
    "31611": "",
    "31621": "",
    "31631": "",
    "31641": "",
    "31642": "",
    "31643": "",
    "31644": "",
    "31645": "",
    "31651": "",
    "31711": "",
    "31721": "",
    "31731": "",
    "31741": "",
    "31742": "",
    "31743": "",
    "31744": "",
    "31745": "",
    "31751": "",
    "31761": "",
    "31811": "",
    "31821": "",
    "31831": "",
    "31832": "",
    "31841": "",
    "31911": "",
    "31921": "",
    "31931": "",
    "42011": "",
    "42021": "",
    "42022": "",
    "42023": "",
    "42031": "",
    "42111": "",
    "42121": "",
    "42122": "",
    "42123": "",
    "42131": "",
    "42141": "",
    "42151": "",
    "42211": "",
    "42212": "",
    "42213": "",
    "42214": "",
    "42215": "",
    "42216": "",
    "42217": "",
    "42221": "",
    "42222": "",
    "42223": "",
    "42224": "",
    "42225": "",
    "422311": "",
    "422312": "",
    "422313": "",
    "422314": "",
    "422315": "",
    "422316": "",
    "422317": "",
    "422318": "",
    "422319": "",
    "422321": "",
    "42241": "",
    "42242": "",
    "42231": "",
    "42311": "",
    "42312": "",
    "42313": "",
    "42314": "",
    "42315": "",
    "42316": "",
    "42317": "",
    "42318": "",
    "42319": "",
    "423110": "",
    "423111": "",
    "423112": "",
    "42321": "",
    "42331": "",
    "42341": "",
    "42351": "",
    "52411": "",
    "52412": "",
    "52413": "",
    "52414": "",
    "52415": "",
    "52511": "",
    "52611": "",
    "52711": "",
    "52721": "",
    "52811": "",
    "52821": "",
    "52831": "",
    "52911": "",
    "52921": "",
    "5301": "",
    "53111": "",
    "53112": "",
    "53113": "",
    "53114": "",
    "53121": "",
    "53122": "",
    "63211": "",
    "63221": "",
    "63231": "",
    "63311": "",
    "63321": "",
    "63322": "",
    "63323": "",
    "63324": "",
    "63325": "",
    "63326": "",
    "63327": "",
    "63328": "",
    "63329": "",
    "633210": "",
    "633211": "",
    "633212": "",
    "63331": ""
  };

  Home(
      {this.id,
      this.hid,
      this.hnum,
      this.hname,
      this.haddr,
      this.htumbon,
      this.hamphur,
      this.hprovince,
      this.community,
      this.harea,
      this.hlive,
      this.hjob,
      this.satisfaction,
      this.latitude,
      this.longitude,
      this.photoSignature,
      this.hmember,
      this.answer});

  factory Home.fromMap(dynamic obj) {
    List<dynamic> listMember = obj["hmember"];
    List<Member> hmember = listMember.map((e) => Member.fromMap(e)).toList();

    Map<String, String> mapAnswer = Map.from(obj["answer"]);

    return Home(
      id: obj["id"],
      hid: obj["hid"],
      hnum: obj["hnum"],
      hname: obj["hname"],
      haddr: obj["haddr"],
      htumbon: obj["htumbon"],
      hamphur: obj["hamphur"],
      hprovince: obj["hprovince"],
      community: obj["cobmmunity"],
      harea: obj["harea"],
      hlive: obj["hlive"],
      hjob: obj["hjob"],
      satisfaction: obj["satisfaction"],
      latitude: obj["latitude"],
      longitude: obj["longitude"],
      photoSignature: obj["photoSignature"],
      hmember: hmember,
      answer: mapAnswer,
    );
  }

  Home.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    hid = json["hid"];
    hnum = json["hnum"];
    hname = json["hname"];
    haddr = json["haddr"];
    htumbon = json["htumbon"];
    hamphur = json["hamphur"];
    hprovince = json["hprovince"];
    community = json["cobmmunity"];
    harea = json["harea"];
    hlive = json["hlive"];
    hjob = json["hjob"];
    satisfaction = json["satisfaction"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    photoSignature = json["photoSignature"];
    hmember = json["hmember"];
    answer = json["answer"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "hid": hid,
      "hnum": hnum,
      "hname": hname,
      "haddr": haddr,
      "htumbon": htumbon,
      "hamphur": hamphur,
      "hprovince": hprovince,
      "community": community,
      "harea": harea,
      "hlive": hlive,
      "hjob": hjob,
      "satisfaction": satisfaction,
      "latitude": latitude,
      "longitude": longitude,
      "photoSignature": photoSignature,
      "hmember": hmember,
      "answer": answer,
    };
  }

  List<Member> memberAgeRange(int from, int to) => hmember
      .where((m) => (m.age().years >= from && m.age().years <= to))
      .toList();

  int countMember() => hmember.length;

  int countMemberFemale15() =>
      hmember.where((m) => (m.age().years > 15 && m.gender == "2")).length;

  int countMemberAgeLessThan1Year() =>
      hmember.where((m) => m.age().years < 1).length;

  int countMemberAge6MonthsTo1Year() =>
      hmember.where((m) => m.age().months >= 6 && m.age().months <= 12).length;

  int countMemberAgeRange(int from, int to) => memberAgeRange(from, to).length;

  int countMemberAge15to59WorkAbility(int from, int to) =>
      memberAgeRange(15, 59)
          .where((m) =>
              (m.jobname != "0110" && m.jobname != "0210") &&
              ((m.ability == "1") ||
                  (m.ability == "0" && (m.health == "0" || m.health == "2"))))
          .length;

  int countMemberAge60Ability() => memberAgeRange(60, 200)
      .where((m) => ((m.ability == "1") ||
          (m.ability == "0" && (m.health == "0" || m.health == "2"))))
      .length;

  int countMemberDisabled() => hmember.where((m) => m.health == "1").length;

  bool hasInformant() => hmember.firstWhere((m) => m.informant == "1") != null;

  int countWelfareCard() => hmember.where((m) => m.welfareCard == "1").length;
}
