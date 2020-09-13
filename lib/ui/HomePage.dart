import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ระบบจัดเก็บข้อมูล จปฐ.'),
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
          child: Center(
            child: ListView(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              shrinkWrap: false,
              children: <Widget>[
                SizedBox(height: 48.0),
                GestureDetector(
                  child: Hero(
                    tag: 'surveys_main_menu',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 72.0,
                      child: Image.asset('images/surveys_main_menu.png'),
                    ),
                  ),
                  onTap: () => {
                    Navigator.of(context).pushNamed("/community"),
                  },
                ),
                SizedBox(height: 24.0),
                Center(
                  child: Text(
                    'เข้าสู่ระบบจัดเก็บข้อมูล',
                    style: TextStyle(color: MyFont.colorMaster, fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 48.0),
                GestureDetector(
                  child: Hero(
                    tag: 'stage_logo',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 72.0,
                      child: Image.asset('images/cddlogo.png'),
                    ),
                  ),
                  onTap: () =>
                      _launchInBrowser("http://cdddata.ddns.me/mis/index.php"),
                ),
                SizedBox(height: 24.0),
                Center(
                  child: Text(
                    'เวทีรับรองระดับตำบล',
                    style: TextStyle(color: MyFont.colorMaster, fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 24.0),
              ],
            ),
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
                title: 'บัตรประจำตัวผู้จัดเก็บ',
                color: Colors.orange,
                onPressed: () => {},
              ),
              SizedBox(width: 24.0),
              PillShapedButton(
                title: 'ออกจากระบบ',
                color: Colors.red,
                onPressed: () async {
                  await app.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (_) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
