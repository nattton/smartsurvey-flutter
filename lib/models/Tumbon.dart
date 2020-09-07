class Tumbon {
  static const tableName = "tbl_tumbon_master";

  final int id;
  final String code;
  final String codename;

  Tumbon({
    this.id,
    this.code,
    this.codename,
  });

  static Tumbon fromMap(dynamic obj) {
    return Tumbon(
      id: obj["id"],
      code: obj["tumbon_id"],
      codename: obj["tumbon_name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "tumbon_id": code,
      "tumbon_name": codename,
    };
  }
}
