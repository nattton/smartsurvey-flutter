import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/Member.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    final repo = app.storage;
    final waiting = repo.getWaiting().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการรอส่ง'),
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
          child: waiting != null
              ? new ListView.builder(
                  itemCount: waiting.length,
                  itemBuilder: (context, i) {
                    return _buildRow(i, waiting[i]);
                  },
                )
              : Container(),
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
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int index, Home home) {
    if (home.hmember.isEmpty)
      return new ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${index + 1}. No Member", style: _biggerFont),
          ],
        ),
        contentPadding: EdgeInsets.fromLTRB(18, 10, 8, 0),
      );
    Member member = home.hmember[0];
    return new ListTile(
      title: Row(children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${index + 1}. ${member.idcard}", style: _biggerFont),
              Text("     ${member.firstname} ${member.lastname}",
                  style: _biggerFont)
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, "/member", arguments: home);
          },
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
          child: GestureDetector(
            child: SizedBox(
                width: 30.0,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.red,
                )),
            onTap: () {
              Navigator.pushNamed(context, "/location", arguments: home);
            },
          ),
        )
      ]),
      contentPadding: EdgeInsets.fromLTRB(18, 10, 8, 0),
    );
  }
}
