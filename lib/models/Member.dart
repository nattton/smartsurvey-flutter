class Member {
  int hostStatus = 0;
  String prefix;
  String prefixName;
  String firstname;
  String lastname;
  String gender;
  String idcard;
  String birthdate;
  String jobname;
  String education;
  String religion;
  String relation;
  String health;
  String ability;
  String informant = "0";
  String welfareCard;
  String welfareUsage;
  String welfareCash;

  Member({
    this.hostStatus = 0,
    this.prefix,
    this.prefixName,
    this.firstname,
    this.lastname,
    this.gender,
    this.idcard,
    this.birthdate,
    this.jobname,
    this.education,
    this.religion,
    this.relation,
    this.health,
    this.ability,
    this.informant = "0",
    this.welfareCard,
    this.welfareUsage,
    this.welfareCash,
  });

  factory Member.fromMap(dynamic obj) {
    return Member(
      hostStatus: obj["hostStatus"],
      prefix: obj["prefix"],
      prefixName: obj["prefixName"],
      firstname: obj["firstname"],
      lastname: obj["lastname"],
      gender: obj["gender"],
      idcard: obj["idcard"],
      birthdate: obj["birthdate"],
      jobname: obj["jobname"],
      education: obj["education"],
      religion: obj["religion"],
      relation: obj["relation"],
      health: obj["health"],
      ability: obj["ability"],
      informant: obj["informant"],
      welfareCard: obj["welfareCard"],
      welfareUsage: obj["welfareUsage"],
      welfareCash: obj["welfareCash"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hostStatus": hostStatus,
      "prefix": prefix,
      "prefixName": prefixName,
      "firstname": firstname,
      "lastname": lastname,
      "gender": gender,
      "idcard": idcard,
      "birthdate": birthdate,
      "jobname": jobname,
      "education": education,
      "religion": religion,
      "relation": relation,
      "health": health,
      "ability": ability,
      "informant": informant,
      "welfareCard": welfareCard,
      "welfareUsage": welfareUsage,
      "welfareCash": welfareCash,
    };
  }
}
