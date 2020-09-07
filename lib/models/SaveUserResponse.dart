class SaveUserResponse {
  int status;
  String confirmid;
  String message;

  SaveUserResponse({this.status, this.confirmid, this.message});

  SaveUserResponse.fromJson(Map<String, dynamic> json) {
    if (json['status'].runtimeType == String)
      status = int.parse(json['status']);
    else
      status = json['status'];
    confirmid = json['confirmid'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['confirmid'] = this.confirmid;
    data['message'] = this.message;
    return data;
  }
}
