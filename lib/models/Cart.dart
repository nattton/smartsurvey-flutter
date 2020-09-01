import 'Family.dart';
import 'WaitingList.dart';

class Cart implements MapConvertible {
  Map<String, int> _itemCounts = Map();
  final WaitingList _store = WaitingList([]);

  Map<String, int> get itemCounts => _itemCounts;

  Cart() {
    _itemCounts = Map();
  }

  Family itemAtIndex(int index) {
    final id = _itemCounts.keys.toList()[index];
    return _store.itemForId(int.parse(id));
  }

  int countAtIndex(int index) {
    return _itemCounts.values.toList()[index];
  }

  void add(Family item, [int quantity = 1]) {
    var count = _itemCounts[item.id.toString()];

    if (count != null) {
      count += quantity;
    } else {
      count = quantity;
    }

    _itemCounts[item.id.toString()] = count;
  }

  void setCount(Family item, int quantity) {
    _itemCounts[item.id.toString()] = quantity;
  }

  void increment(Family item) {
    var count = _itemCounts[item.id.toString()];

    if (count != null) {
      count += 1;
    }

    _itemCounts[item.id.toString()] = count;
  }

  int decrement(Family item) {
    var count = _itemCounts[item.id.toString()];

    if (count != null) {
      count -= 1;
    }

    _itemCounts[item.id.toString()] = count;

    return count;
  }

  void remove(Family item) {
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
