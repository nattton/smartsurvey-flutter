import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';

class SurveyBody {
  static Scaffold build({BuildContext context, String title, Widget child}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(30.0))),
              child: child)),
    );
  }
}
