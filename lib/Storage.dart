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

import 'dart:io';

import 'package:device_info/device_info.dart';
import 'Repository.dart';

import 'models/Family.dart';
import 'models/Cart.dart';
import 'models/User.dart';

class Storage {
  Cart _cart;
  User _user;
  String _deviceId;

  set user(User user) {
    _user = user;
    if (_user != null) {
      restoreCart();
    } else {
      _cart = Cart();
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
    _cart = Cart();
    _user = user;
  }

  void restoreCart() async {
    _cart = await getAllItemsInCart();
  }

  Future<Cart> getAllItemsInCart() async {
    final cartMap = await _repository.getObject(_user?.uid ?? '', 'cart');
    if (cartMap == null || cartMap.isEmpty) {
      return Cart();
    }
    cartMap.map((key, value) => MapEntry(int.parse(key), 1));
    return Cart().fromMap(Map<String, int>.from(cartMap));
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

    await _repository.saveString(_deviceId, 'user.fname', user.fname);
    await _repository.saveString(_deviceId, 'user.uid', user.uid);

    _user = user;
    _cart = await getAllItemsInCart();
  }

  Cart getCart(User user) {
    return _cart;
  }

  Future<User> getUser() async {
    _deviceId = await deviceId();

    final fname = await _repository.getString(_deviceId, 'user.fname');
    final uid = await _repository.getString(_deviceId, 'user.uid');
    final photo = await _repository.getString(_deviceId, 'user.photo');

    if (fname == null) {
      return null;
    }

    final user = User(fname: fname, uid: uid, photo: photo);

    return user;
  }

  void logout() async {
    _deviceId = await deviceId();

    await _repository.removeString(_deviceId, 'user.fname');
    await _repository.removeString(_deviceId, 'user.uid');
    await _repository.removeString(_deviceId, 'user.photo');

    for (var entry in _cart.itemCounts.entries) {
      await _repository.removeObject(_user.uid, entry.key.toString());
    }

    _user = null;
    _cart = Cart();
  }

  void _saveCart() async {
    await _repository.saveObject(_user.uid, 'cart', _cart.toMap());
  }

  void addToCart(Family item, [int quantity = 1]) async {
    _cart.add(item);
    _saveCart();
  }

  void incrementInCart(Family item) async {
    _cart.increment(item);
    _saveCart();
  }

  void decrementInCart(Family item) async {
    final int count = _cart.decrement(item);
    if (count == null || count <= 0) {
      _cart.remove(item);
    }

    _saveCart();
  }

  void setItemCountInCart(Family item, int quantity) async {
    _saveCart();
  }
}
