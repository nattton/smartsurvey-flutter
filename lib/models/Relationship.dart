class Relationship {
  static const tableName = "tbl_relationship_master";

  final int id;
  final String code;
  final String codename;

  Relationship({
    this.id,
    this.code,
    this.codename,
  });

  static Relationship fromMap(dynamic obj) {
    return Relationship(
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
