import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/data/AppService.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';

import '../constants/MyFont.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bgimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: MyFont.colorBG,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),
            child: Center(
              child: ListView(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                shrinkWrap: true,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.asset('images/cddlogo.png'),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Center(
                    child: Text(
                      'ระบบจัดเก็บข้อมูล',
                      style:
                          TextStyle(color: MyFont.colorMaster, fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                      child: Text('ความจำเป็นพื้นฐาน ( จปฐ. )',
                          style: TextStyle(
                              color: MyFont.colorMaster, fontSize: 20.0))),
                  SizedBox(height: 24.0),
                  TextField(
                    controller: _usernameController,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _passwordController,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(height: 24.0),
                  PillShapedButton(
                    title: 'เข้าสู่ระบบ',
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _login(context),
                  ),
                  FlatButton(
                    child: Text(
                      'ลืมรหัสผ่าน ?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _login(BuildContext context) async {
    if (_usernameController.text == '' || _passwordController.text == '') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('กรุณากรอก Username และ Password'),
            );
          });
      return;
    }

    final user = await AppService.login(
        _usernameController.text, _passwordController.text);
    if (user.status == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Username หรือ Password ไม่ถูกต้อง'),
            );
          });
    } else if (user.status == 1) {
      final app = Provider.of<SurveyApp>(context);
      final repo = app.storage;
      await repo.saveUser(user);
      await repo.saveString("username", _usernameController.text);
      await repo.saveString("password", _passwordController.text);

      if (user.activation == 1) {
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        Navigator.of(context).pushReplacementNamed("/register");
      }
    }
  }
}
