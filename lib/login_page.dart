import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameKey = GlobalKey<FormFieldState>();
  var _passwordKey = GlobalKey<FormFieldState>();
  
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/cddlogo.png'),
      ),
    );


    final username = TextFormField(
      key: _usernameKey,
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final password = TextFormField(
      key: _passwordKey,
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        onPressed: () {
          if (_usernameKey.currentState.value == 'admin' && _passwordKey.currentState.value == '1234') {
            Navigator.of(context).pushNamed(HomePage.routeName);
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Username หรือ Password ไม่ถูกต้อง'),
                );
              }
            );
          }
        },
        padding: EdgeInsets.all(12),
        color: Color(0xFFF16a00),
        child: Text('Login', style: TextStyle(color: Colors.white),),
      ),
    );

    final forgetLabel = FlatButton(
      child: Text(
        'Forgot Password ?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {

      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          shrinkWrap: true,
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgetLabel
          ],
        ),
      ),
    );

  }
}