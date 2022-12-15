import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/data/AppService.dart';
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

  List<Home> waiting = [];

  @override
  void initState() {
    super.initState();
    _loadWaiting();
  }

  _loadWaiting() {
    final app = Provider.of<SurveyApp>(context, listen: false);
    final repo = app.storage;
    waiting = repo.getWaiting().toList();
  }

  @override
  Widget build(BuildContext context) {
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
      return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${index + 1}. No Member", style: _biggerFont),
          ],
        ),
        contentPadding: EdgeInsets.fromLTRB(18, 10, 8, 0),
      );
    Member member = home.hmember[0];
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(const Radius.circular(6.0))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 12.0, 16.0),
          child: Row(children: [
            GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${member.idcard}", style: _biggerFont),
                  Text(
                      "${member.prefixName} ${member.firstname} ${member.lastname}",
                      style: _biggerFont)
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, "/member", arguments: home);
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 18.0, 0.0),
              child: GestureDetector(
                child: SizedBox(
                    width: 36.0,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black38,
                      size: 36.0,
                    )),
                onTap: () {
                  Navigator.pushNamed(context, "/location", arguments: home)
                      .then((value) => setState(() {
                            _loadWaiting();
                          }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 18.0, 0.0),
              child: GestureDetector(
                child: SizedBox(
                    width: 30.0,
                    child: Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: 36.0,
                    )),
                onTap: () async {
                  _sendData(home);
                },
              ),
            ),
            GestureDetector(
              child: SizedBox(
                  width: 30.0,
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 36.0,
                  )),
              onTap: () {
                _removeHome(home);
              },
            )
          ]),
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(18, 10, 8, 0),
    );
  }

  void _sendData(Home home) async {
    final app = Provider.of<SurveyApp>(context, listen: false);
    final repo = app.storage;

    var response = await AppService.saveSurvey(app.user, home);
    if (response.status == "1") {
      await repo.removeWaiting(home);
      setState(() {
        waiting = repo.getWaiting().toList();
      });

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("ผลการบันทึกข้อมูล"),
              content: Text(response.message),
              actions: [
                TextButton(
                  child: Text("ตกลง"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("ผลการบันทึกข้อมูล"),
              content: Text(response.message),
              actions: [
                TextButton(
                  child: Text("ปิด"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  void _removeHome(Home home) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("แจ้งเตือน"),
            content: Text("ต้องการลบข้อมูลชุดนี้ ?"),
            actions: [
              TextButton(
                child: Text("ยกเลิก"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text("ตกลง"),
                onPressed: () async {
                  final app = Provider.of<SurveyApp>(context, listen: false);
                  final repo = app.storage;
                  await repo.removeWaiting(home);
                  setState(() {
                    waiting = repo.getWaiting().toList();
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
