class CommunityAPI {
  int status;
  String provinceCode;
  String provinceName;
  String amphurCode;
  String amphurName;
  String tumbonCode;
  String tumbonName;
  String communityId;
  String communityName;
  String moo;
  int familyAmount;
  int surveyAmount;
  String message;

  CommunityAPI(
      {this.status,
      this.provinceCode,
      this.provinceName,
      this.amphurCode,
      this.amphurName,
      this.tumbonCode,
      this.tumbonName,
      this.communityId,
      this.communityName,
      this.moo,
      this.familyAmount,
      this.surveyAmount,
      this.message});

  CommunityAPI.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    provinceCode = json['province_code'];
    provinceName = json['province_name'];
    amphurCode = json['amphur_code'];
    amphurName = json['amphur_name'];
    tumbonCode = json['tumbon_code'];
    tumbonName = json['tumbon_name'];
    communityId = json['community_id'];
    communityName = json['community_name'];
    moo = json['moo'];
    familyAmount = json['family_amount'];
    surveyAmount = json['survey_amount'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['province_code'] = this.provinceCode;
    data['province_name'] = this.provinceName;
    data['amphur_code'] = this.amphurCode;
    data['amphur_name'] = this.amphurName;
    data['tumbon_code'] = this.tumbonCode;
    data['tumbon_name'] = this.tumbonName;
    data['community_id'] = this.communityId;
    data['community_name'] = this.communityName;
    data['moo'] = this.moo;
    data['family_amount'] = this.familyAmount;
    data['survey_amount'] = this.surveyAmount;
    data['message'] = this.message;
    return data;
  }
}
