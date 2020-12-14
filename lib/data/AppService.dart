import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:smartsurveys/models/CommunityAPI.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SaveUserResponse.dart';
import 'package:smartsurveys/models/SaveSurveyResponse.dart';
import 'package:smartsurveys/models/User.dart';

class AppService {
  static final hostLogin = 'http://cddlogin.ddns.me/api/';
  static final apiToken = 'Q09NTVVOSVRZIERFVkVMT1BNRU5UIERFUEFSVE1FTlQ=';

  Future<String> deviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var deviceId = '';
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = await androidInfo.androidId;
    } else {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = await iosInfo.identifierForVendor;
    }

    return deviceId;
  }

  static Future<User> login(String userName, String password) async {
    await EasyLoading.show(
      status: 'loading...',
    );
    var url = "${hostLogin}mobile.php";
    var response = await http.post(url, body: {
      'task': 'login',
      't': apiToken,
      'u': userName,
      'p': password,
    });
    debugPrint(response.body);
    Map map = json.decode(response.body);
    User user = User.fromJson(map);
    EasyLoading.dismiss();
    return user;
  }

  static Future<SaveUserResponse> saveUserInfo(
    User user,
    String prefixID,
    String name,
    String sname,
    String idCard,
    String phone,
    String sexId,
    String birthday,
    String addr,
    String provinceCode,
    String amphurCode,
    String tumbonCode,
    String communityID,
    String signatureImage,
  ) async {
    await EasyLoading.show(
      status: 'loading...',
    );
    var url = "${hostLogin}mobile.php";
    var response = await http.post(url, body: {
      't': apiToken,
      'token': user.token,
      'task': 'saveuserinfo',
      'prefix_id': prefixID,
      'name': name,
      'sname': sname,
      'idcard': idCard,
      'phone': phone,
      'sex_id': sexId,
      'birthday': birthday,
      'addr': addr,
      'province_code': provinceCode,
      'amphur_code': amphurCode,
      'district_code': tumbonCode,
      'community_id': communityID,
      'photo_signature': signatureImage,
    });
    Map map = json.decode(response.body);
    SaveUserResponse userResponse = SaveUserResponse.fromJson(map);
    EasyLoading.dismiss();
    return userResponse;
  }

  static Future<List<CommunityAPI>> getCommunity(User user) async {
    await EasyLoading.show(
      status: 'loading...',
    );
    var url =
        "${hostLogin}mobile.php?t=$apiToken&task=getcommunity&token=${user.token}";
    var response = await http.get(url);
    List<dynamic> listMap = json.decode(response.body);
    EasyLoading.dismiss();
    return listMap.map((m) => CommunityAPI.fromJson(m)).toList();
  }

  static Future<SaveSurveyResponse> saveSurvey(User user, Home home) async {
    await EasyLoading.show(
      status: 'loading...',
    );
    var url = "${hostLogin}mobile.php";
    String objString = jsonEncode(home);
    var response = await http.post(url, body: {
      'uid': user.uid,
      't': apiToken,
      'token': user.token,
      'task': 'savesurvey',
      'family': objString,
    });

    Map map = json.decode(response.body);
    SaveSurveyResponse uploadResponse = SaveSurveyResponse.fromJson(map);
    EasyLoading.dismiss();
    return uploadResponse;
  }
}
