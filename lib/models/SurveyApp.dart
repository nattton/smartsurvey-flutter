import 'package:flutter/material.dart';
import 'package:smartsurveys/Storage.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/User.dart';

class SurveyApp with ChangeNotifier {
  SurveyApp(this._family, this._storage);

  final Home _family;
  final Storage _storage;

  Home get store => _family;

  Storage get storage => _storage;

  User get user => _storage?.user;

  void refresh() {
    notifyListeners();
  }

  void logout() async {
    await _storage.logout();
  }
}
