class User {
  int status;
  String token;
  int uid;
  int activation;
  String fname;
  String lname;
  String idcard;
  String addr;
  String addr2;
  String position;
  String photo;
  String provinceCode;
  String provinceName;
  String amphurCode;
  String amphurName;
  String tumbonCode;
  String tumbonName;
  String message;

  User(
      {this.status,
      this.token,
      this.uid,
      this.activation,
      this.fname,
      this.lname,
      this.idcard,
      this.addr,
      this.addr2,
      this.position,
      this.photo,
      this.provinceCode,
      this.provinceName,
      this.amphurCode,
      this.amphurName,
      this.tumbonCode,
      this.tumbonName,
      this.message});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    uid = json['uid'];
    activation = json['activation'];
    fname = json['fname'];
    lname = json['lname'];
    idcard = json['idcard'];
    addr = json['addr'];
    addr2 = json['addr2'];
    position = json['position'];
    photo = json['photo'];
    provinceCode = json['province_code'];
    provinceName = json['province_name'];
    amphurCode = json['amphur_code'];
    amphurName = json['amphur_name'];
    tumbonCode = json['tumbon_code'];
    tumbonName = json['tumbon_name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['uid'] = this.uid;
    data['activation'] = this.activation;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['idcard'] = this.idcard;
    data['addr'] = this.addr;
    data['addr2'] = this.addr2;
    data['position'] = this.position;
    data['photo'] = this.photo;
    data['province_code'] = this.provinceCode;
    data['province_name'] = this.provinceName;
    data['amphur_code'] = this.amphurCode;
    data['amphur_name'] = this.amphurName;
    data['tumbon_code'] = this.tumbonCode;
    data['tumbon_name'] = this.tumbonName;
    data['message'] = this.message;
    return data;
  }
}
