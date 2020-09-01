import 'package:flutter/material.dart';
import 'package:smartsurveys/ui/SurveyGroupPage.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'home-page';

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

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Alucard',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to Smart Survey',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    return SurveyGroupPage();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent])),
        child: Column(
          children: <Widget>[logo, welcome, lorem, SurveyGroupPage()],
        ),
      ),
    );
  }
}
