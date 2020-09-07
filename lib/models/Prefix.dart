class Prefix {
  static const tableName = "tbl_prefix_master";

  final int id;
  final String code;
  final String codename;

  Prefix({
    this.id,
    this.code,
    this.codename,
  });

  static Prefix fromMap(dynamic obj) {
    return Prefix(
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
