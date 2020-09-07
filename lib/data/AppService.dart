import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:smartsurveys/models/SaveUserResponse.dart';
import 'package:smartsurveys/models/User.dart';

class AppService {
  static final hostLogin = 'http://cddlogin.ddns.me/api/';
  static final apiToken = 'Q09NTVVOSVRZIERFVkVMT1BNRU5UIERFUEFSVE1FTlQ=';
  static Future<User> login(String userName, String password) async {
    var url = "${hostLogin}mobile.php";
    var response = await http.post(url, body: {
      'task': 'login',
      't': apiToken,
      'u': userName,
      'p': password,
    });
    Map map = json.decode(response.body);
    User user = User.fromJson(map);
    print(user.fname);
    return user;
  }

  static Future<SaveUserResponse> saveUserInfo(
    String prefixID,
    String name,
    String sname,
    String idCard,
    String sexId,
    String birthday,
    String addr,
    String provinceCode,
    String amphurCode,
    String tumbonCode,
    String communityID,
    String signatureImage,
  ) async {
    var url = "${hostLogin}mobile.php";
    var response = await http.post(url, body: {
      'task': 'saveuserinfo',
      't': apiToken,
      'prefix_id': prefixID,
      'name': name,
      'sname': sname,
      'idcard': idCard,
      'sex_id': sexId,
      'birthday': birthday,
      'addr': addr,
      'province_code': provinceCode,
      'amphur_code': amphurCode,
      'district_code': tumbonCode,
      'community_id': communityID,
      'photo_signature': signatureImage,
    });
    debugPrint(response.body);
    Map map = json.decode(response.body);
    SaveUserResponse user = SaveUserResponse.fromJson(map);
    return user;
  }
}
