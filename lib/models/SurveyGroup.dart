class SurveyGroup {
  static const tableName = "tbl_survey_group_master";

  final int id;
  final String groupNo;
  final String groupName;
  final String groupDisplay;
  final String groupImage;
  final String groupMetric;

  SurveyGroup(
      {this.id,
      this.groupNo,
      this.groupName,
      this.groupDisplay,
      this.groupImage,
      this.groupMetric});

  static SurveyGroup fromMap(dynamic obj) {
    return SurveyGroup(
        id: obj["id"],
        groupNo: obj["group_no"],
        groupName: obj["group_name"],
        groupDisplay: obj["group_display"],
        groupImage: obj["group_image"],
        groupMetric: obj["group_metric"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "group_no": groupNo,
      "group_name": groupName,
      "group_display": groupDisplay,
      "group_image": groupImage,
      "group_metric": groupMetric
    };
  }
}
