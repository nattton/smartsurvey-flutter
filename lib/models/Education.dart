class Education {
  static const tableName = "tbl_education_master";

  final int id;
  final String code;
  final String codename;

  Education({
    this.id,
    this.code,
    this.codename,
  });

  static Education fromMap(dynamic obj) {
    return Education(
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
