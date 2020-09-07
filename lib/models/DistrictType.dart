class DistrictType {
  static const tableName = "tbl_district_type_master";

  final int id;
  final int provinceId;
  final int amphurId;
  final String districtTypeName;

  DistrictType({
    this.id,
    this.provinceId,
    this.amphurId,
    this.districtTypeName,
  });

  static DistrictType fromMap(dynamic obj) {
    return DistrictType(
      id: obj["id"],
      provinceId: obj["province_id"],
      amphurId: obj["amphur_id"],
      districtTypeName: obj["district_type_name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "province_id": provinceId,
      "amphur_id": amphurId,
      "district_type_name": districtTypeName,
    };
  }
}
