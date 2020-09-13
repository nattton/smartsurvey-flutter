import 'Home.dart';

class Waiting {
  List<Home> _store = new List<Home>();

  Waiting();

  List<Home> toList() {
    return _store;
  }

  Home itemAtIndex(int index) {
    return _store[index];
  }

  Home itemID(int id) {
    return _store.firstWhere((e) => e.id == id);
  }

  void addOrUpdate(Home item) {
    int index = _store.indexWhere((e) => e.id == item.id);
    if (index == -1)
      _store.add(item);
    else
      _store[index] = item;
  }

  void remove(int id) {
    _store.remove(id);
  }

  Map toMap() {
    return {"store": _store};
  }

  Waiting.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json["store"];
    _store = list.map((e) => Home.fromMap(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {"store": _store};
  }
}
