import 'package:smartsurveys/models/MapConvertible.dart';

import 'Home.dart';
import 'WaitingList.dart';

class Cart implements MapConvertible {
  Map<String, int> _itemCounts = Map();
  final WaitingList _store = WaitingList([]);

  Map<String, int> get itemCounts => _itemCounts;

  Cart() {
    _itemCounts = Map();
  }

  Home itemAtIndex(int index) {
    final id = _itemCounts.keys.toList()[index];
    return _store.itemForId(int.parse(id));
  }

  int countAtIndex(int index) {
    return _itemCounts.values.toList()[index];
  }

  void add(Home item, [int quantity = 1]) {
    var count = _itemCounts[item.id.toString()];

    if (count != null) {
      count += quantity;
    } else {
      count = quantity;
    }

    _itemCounts[item.id.toString()] = count;
  }

  void setCount(Home item, int quantity) {
    _itemCounts[item.id.toString()] = quantity;
  }

  void increment(Home item) {
    var count = _itemCounts[item.id.toString()];

    if (count != null) {
      count += 1;
    }

    _itemCounts[item.id.toString()] = count;
  }

  int decrement(Home item) {
    var count = _itemCounts[item.id.toString()];

    if (count != null) {
      count -= 1;
    }

    _itemCounts[item.id.toString()] = count;

    return count;
  }

  void remove(Home item) {
    _itemCounts.remove(item.id.toString());
  }

  @override
  Map<dynamic, dynamic> toMap() {
    return _itemCounts;
  }

  @override
  Cart fromMap(Map<dynamic, dynamic> map) {
    final cart = Cart();
    cart._itemCounts = map;
    return cart;
  }
}
