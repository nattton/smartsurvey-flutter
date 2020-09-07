class Province {
  static const tableName = "tbl_province_master";

  final int id;
  final String code;
  final String codename;

  Province({
    this.id,
    this.code,
    this.codename,
  });

  static Province fromMap(dynamic obj) {
    return Province(
      id: obj["id"],
      code: obj["provice_id"],
      codename: obj["province_name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "provice_id": code,
      "province_name": codename,
    };
  }
}
