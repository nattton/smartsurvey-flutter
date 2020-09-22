class SaveSurveyResponse {
  int status;
  String confirmid;
  String message;
  String receive;

  SaveSurveyResponse({this.status, this.confirmid, this.message, this.receive});

  SaveSurveyResponse.fromJson(Map<String, dynamic> json) {
    if (json['status'].runtimeType == String)
      status = int.parse(json['status']);
    else
      status = json['status'];
    confirmid = json['confirmid'];
    message = json['message'];
    receive = json['receive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['confirmid'] = this.confirmid;
    data['message'] = this.message;
    data['receive'] = this.receive;
    return data;
  }
}
