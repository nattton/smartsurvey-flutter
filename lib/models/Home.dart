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
  Map<String, String> answer = Map();

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

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "hid": hid,
  //     "hnum": hnum,
  //     "hname": hname,
  //     "haddr": haddr,
  //     "htumbon": htumbon,
  //     "hamphur": hamphur,
  //     "hprovince": hprovince,
  //     "community": community,
  //     "harea": harea,
  //     "hlive": hlive,
  //     "hjob": hjob,
  //     "satisfaction": satisfaction,
  //     "latitude": latitude,
  //     "longitude": longitude,
  //     "photoSignature": photoSignature,
  //     "hmember": hmember,
  //     "answer": answer,
  //   };
  // }

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
}
