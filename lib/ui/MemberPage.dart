import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/Member.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/ui/NewMemberPage.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';

class MemberPage extends StatefulWidget {
  final Home home;
  MemberPage({key, this.home}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState(home: home);
}

class _MemberPageState extends State<MemberPage> {
  Home home;
  _MemberPageState({this.home});

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    app.currentHome = home;
    return Scaffold(
        appBar: AppBar(
          title: Text('ข้อมูลสมาชิก'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bgimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: MyFont.colorBG,
                borderRadius:
                    new BorderRadius.all(const Radius.circular(30.0))),
            child: app.currentHome.hmember != null
                ? new ListView.builder(
                    itemCount: app.currentHome.hmember.length,
                    itemBuilder: (context, i) {
                      return _buildRow(i, app.currentHome.hmember[i]);
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
                  title: 'เพิ่มสมาชิก',
                  color: Colors.orange,
                  onPressed: () async {
                    // Navigator.of(context)
                    //     .pushNamed('/newmember', arguments: home);
                    Navigator.of(context)
                        .push(CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => NewMemberPage(
                            home: app.currentHome,
                          ),
                        ))
                        .then((value) => setState(() {}));
                  },
                ),
                SizedBox(width: 24.0),
                PillShapedButton(
                  title: 'เริ่มสำรวจ',
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/surveygroup', arguments: app.currentHome);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildRow(int index, Member item) {
    return new ListTile(
      title: Row(children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${index + 1}. ${item.prefixName} ${item.firstname} ${item.lastname} (อายุ " +
                      item.age().years.toString() +
                      " ปี)",
                  style: _biggerFont),
              Text("     ${item.idcard}", style: _biggerFont)
            ],
          ),
          onTap: () {},
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
          child: GestureDetector(
            child:
                SizedBox(width: 30.0, child: Image.asset("images/trash.png")),
            onTap: () {
              _removeMember(index);
            },
          ),
        )
      ]),
      contentPadding: EdgeInsets.fromLTRB(18, 10, 8, 0),
    );
  }

  void _removeMember(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("แจ้งเตือน"),
            content: Text("ต้องการลบข้อมูลชุดนี้ ?"),
            actions: [
              FlatButton(
                child: Text("ยกเลิก"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("ตกลง"),
                onPressed: () async {
                  setState(() {
                    home.hmember.removeAt(index);
                  });
                  final app = Provider.of<SurveyApp>(context, listen: false);
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
