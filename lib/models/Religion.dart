class Religion {
  static const tableName = "tbl_religion_master";

  final int id;
  final String code;
  final String codename;

  Religion({
    this.id,
    this.code,
    this.codename,
  });

  static Religion fromMap(dynamic obj) {
    return Religion(
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
