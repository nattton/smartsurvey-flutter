abstract class MapConvertible {
  Map<dynamic, dynamic> toMap();

  MapConvertible fromMap(Map<dynamic, dynamic> map);
}

class Family {
  final int id;
  String community;
  String hid;
  Map<String, String> answer;
  Family(this.id, {this.hid, this.community, this.answer});
}
