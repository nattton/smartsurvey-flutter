class Amphur {
  static const tableName = "tbl_amphur_master";

  final int id;
  final String code;
  final String codename;

  Amphur({
    this.id,
    this.code,
    this.codename,
  });

  static Amphur fromMap(dynamic obj) {
    return Amphur(
      id: obj["id"],
      code: obj["amphur_id"],
      codename: obj["amphur_name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "amphur_id": code,
      "amphur_name": codename,
    };
  }
}
