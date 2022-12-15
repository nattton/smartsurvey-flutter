import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/data/AppService.dart';
import 'package:smartsurveys/models/CommunityAPI.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('สถานะรายการรับผิดชอบ'),
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
            future: AppService.getCommunity(app.user),
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
      bottomNavigationBar: BottomAppBar(
        color: MyFont.colorBottomBar,
        child: Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PillShapedButton(
                title: 'รายการรอส่ง',
                color: Colors.orange,
                onPressed: () async {
                  Navigator.of(context).pushNamed("/waiting");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(CommunityAPI item) {
    return GestureDetector(
      child: new ListTile(
        title: new Text("หมู่ที่ ${item.moo} ${item.communityName}",
            style: _biggerFont),
        contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: new Text("ยืนยันเลือกชุมชน"),
              content: new Text(item.communityName),
              actions: [
                new TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: new Text("ยกเลิก"),
                ),
                new TextButton(
                  onPressed: () => Navigator.of(context)
                      .popAndPushNamed("/newhome", arguments: {'cm': item}),
                  child: new Text("ตกลง"),
                )
              ],
            );
          },
        );
      },
    );
  }
}
