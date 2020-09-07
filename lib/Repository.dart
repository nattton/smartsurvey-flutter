import 'dart:typed_data';
import 'package:smartsurveys/models/User.dart';

abstract class Repository {
  void saveString(String userId, String key, String value);

  Future<String> saveImage(String userId, String key, Uint8List image);

  void saveObject(String userId, String key, Map<String, dynamic> object);

  void saveUser(String deviceId, User object);

  Future<String> getString(String userId, String key);

  Future<User> getUser(String deviceId);

  Future<Uint8List> getImage(String userId, String key);

  Future<Map<String, dynamic>> getObject(String userId, String key);

  Future<void> removeUser(String deviceId);

  Future<void> removeString(String userId, String key);

  Future<void> removeImage(String userId, String key);

  Future<void> removeObject(String userId, String key);
}
