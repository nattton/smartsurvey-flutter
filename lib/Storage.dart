import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'Repository.dart';

import 'models/Home.dart';
import 'models/Waiting.dart';
import 'models/User.dart';

class Storage {
  Waiting _waiting;
  User _user;
  String _deviceId;

  set user(User user) {
    _user = user;
    if (_user != null) {
      restoreWaiting();
    } else {
      _waiting = Waiting();
    }
  }

  final Repository _repository;

  static Future<Storage> create({Repository repository}) async {
    final ret = Storage(repository);
    ret.user = await ret.getUser();

    return ret;
  }

  User get user => _user;

  Storage(this._repository, [User user]) {
    _waiting = Waiting();
    _user = user;
  }

  void restoreWaiting() async {
    _waiting = await getAllItemsInCart();
  }

  Future<Waiting> getAllItemsInCart() async {
    final waitingString =
        await _repository.getString(_user?.uid.toString() ?? '', 'waiting');
    if (waitingString == null || waitingString.isEmpty) {
      return Waiting();
    }
    Map cartMap = json.decode(waitingString);
    return Waiting.fromJson(cartMap);
  }

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

  void saveUser(User user) async {
    _deviceId = await deviceId();

    await _repository.saveUser(_deviceId, user);

    _user = user;
    _waiting = await getAllItemsInCart();
  }

  void saveString(String key, String value) async {
    _deviceId = await deviceId();

    await _repository.saveString(_deviceId, key, value);
  }

  Waiting getWaiting() {
    return _waiting;
  }

  Future<User> getUser() async {
    _deviceId = await deviceId();

    user = await _repository.getUser(_deviceId);

    return user;
  }

  Future<String> getString(String key) async {
    _deviceId = await deviceId();

    return await _repository.getString(_deviceId, key);
  }

  void logout() async {
    _deviceId = await deviceId();

    await _repository.removeUser(_deviceId);
    await _repository.removeString(_user.uid.toString(), 'waiting');

    _user = null;
    _waiting = Waiting();
  }

  void _saveWaiting() async {
    String objectString = jsonEncode(_waiting);
    await _repository.saveString(_user.uid.toString(), 'waiting', objectString);
  }

  void addToWaiting(Home item) async {
    _waiting.addOrUpdate(item);
    await _saveWaiting();
  }

  void removeWaiting(Home item) async {
    _waiting.remove(item);
    await _saveWaiting();
  }
}
