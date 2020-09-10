import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/DistrictType.dart';
import 'package:smartsurveys/models/Family.dart';

class DistrictTypePage extends StatefulWidget {
  final Family family;
  DistrictTypePage({key, this.family}) : super(key: key);

  @override
  _DistrictTypePageState createState() =>
      _DistrictTypePageState(family: family);
}

class _DistrictTypePageState extends State<DistrictTypePage> {
  final Family family;
  _DistrictTypePageState({this.family});

  QueryCtr _query = QueryCtr();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เขตการปกครองส่วนท้องถิ่น'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgimage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: MyFont.colorBG,
              borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
          child: FutureBuilder<List>(
            future: _query.getDistrictTypes(family.hamphur),
            initialData: List(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? new ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return _buildRow(snapshot.data[i]);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRow(DistrictType item) {
    return GestureDetector(
      child: new ListTile(
        title: new Text(item.districtTypeName, style: _biggerFont),
        contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      ),
      onTap: () {
        family.harea = item.id.toString();
        Navigator.of(context).pushNamed("/arearesidance", arguments: family);
      },
    );
  }
}
