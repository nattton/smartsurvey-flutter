class LandRights {
  static const tableName = "tbl_land_rights_master";

  final int id;
  final String code;
  final String codename;

  LandRights({
    this.id,
    this.code,
    this.codename,
  });

  static LandRights fromMap(dynamic obj) {
    return LandRights(
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
