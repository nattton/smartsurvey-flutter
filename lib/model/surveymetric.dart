class SurveyMetric {
  static const tableName = 'tbl_survey_metric_master';
  static const columnGroupId = 'tbl_survey_group_masterid';

  final int id;
  final int groupId;
  final String metricNo;
  final String metricName;
  final String metricDisplay;
  final String metricDescription;

  SurveyMetric(
      {this.id,
        this.groupId,
        this.metricNo,
        this.metricName,
        this.metricDisplay,
        this.metricDescription});

  static SurveyMetric fromMap(dynamic obj) {
    return SurveyMetric(
        id: obj["id"],
        groupId: obj["tbl_survey_group_masterid"],
        metricNo: obj["metric_no"],
        metricName: obj["metric_name"],
        metricDisplay: obj["metric_display"],
        metricDescription: obj["metric_description"]
    );
  }
}
