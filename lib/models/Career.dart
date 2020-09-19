class Career {
  static const tableName = "tbl_career_master";

  final int id;
  final String code;
  final String codename;

  Career({
    this.id,
    this.code,
    this.codename,
  });

  static Career fromMap(dynamic obj) {
    return Career(
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
