class Community {
  static const tableName = "tbl_community_master";

  final int id;
  final String code;
  final String moo;
  final String codename;

  Community({
    this.id,
    this.code,
    this.moo,
    this.codename,
  });

  static Community fromMap(dynamic obj) {
    return Community(
      id: obj["id"],
      code: obj["community_id"],
      moo: obj["community_moo"],
      codename: obj["community_name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "community_id": code,
      "community_moo": moo,
      "community_name": codename,
    };
  }
}
