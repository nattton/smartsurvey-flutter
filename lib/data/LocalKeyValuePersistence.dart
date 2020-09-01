/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../Repository.dart';

class LocalKeyValuePersistence implements Repository {
  String _generateKey(String userId, String key) {
    return '$userId/$key';
  }

  @override
  Future<String> saveImage(String userId, String key, Uint8List image) async {
    final base64Image = Base64Encoder().convert(image);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_generateKey(userId, key), base64Image);
    return _generateKey(userId, key);
  }

  @override
  void saveObject(
      String userId, String key, Map<String, dynamic> object) async {
    final prefs = await SharedPreferences.getInstance();
    final string = JsonEncoder().convert(object);

    await prefs.setString(_generateKey(userId, key), string);
  }

  @override
  void saveString(String userId, String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_generateKey(userId, key), value);
  }

  @override
  Future<Uint8List> getImage(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final base64Image = prefs.getString(_generateKey(userId, key));
    if (base64Image != null) return Base64Decoder().convert(base64Image);
    return null;
  }

  @override
  Future<Map<String, dynamic>> getObject(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final objectString = prefs.getString(_generateKey(userId, key));
    if (objectString != null)
      return JsonDecoder().convert(objectString) as Map<String, dynamic>;
    return null;
  }

  @override
  Future<String> getString(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_generateKey(userId, key));
  }

  @override
  Future<void> removeImage(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_generateKey(userId, key));
  }

  @override
  Future<void> removeObject(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_generateKey(userId, key));
  }

  @override
  Future<void> removeString(String userId, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_generateKey(userId, key));
  }
}
