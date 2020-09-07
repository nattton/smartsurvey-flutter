class Gender {
  static const tableName = "tbl_gender_master";

  final int id;
  final String code;
  final String codename;

  Gender({
    this.id,
    this.code,
    this.codename,
  });

  static Gender fromMap(dynamic obj) {
    return Gender(
      id: obj["id"],
      code: obj["code"],
      codename: obj["codename"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "code": code,
      "codename": codename,
    };
  }
}
