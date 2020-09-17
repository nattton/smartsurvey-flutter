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
                  onPressed: () async {
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
    return GestureDetector(
      child: new ListTile(
        title: Column(
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
        contentPadding: EdgeInsets.fromLTRB(18, 10, 8, 0),
      ),
      onTap: () {},
    );
  }
}
