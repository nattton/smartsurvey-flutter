import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smartsurveys/database/query.dart';
import 'package:smartsurveys/model/surveygroup.dart';
import 'package:smartsurveys/ui/surveymetric_page.dart';

class SurveyGroupPage extends StatefulWidget {
  static String routeName = 'surveygroup-page';

  @override
  _SurveyGroupPageState createState() => _SurveyGroupPageState();
}

class _SurveyGroupPageState extends State<SurveyGroupPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  QueryCtr _query = QueryCtr();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
        title: Text('หมวดรายการสำรวจ'),
    ),
    body: FutureBuilder<List>(
      future: _query.getAllSurveyGroups(),
      initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData ?
            new ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return _buildRow(snapshot.data[i]);
                },
            )
            : Center(
          child: CircularProgressIndicator(),
        );
      },
    )
    );
  }

  Widget _buildRow(SurveyGroup sg) {
    Uint8List byte = base64.decode(sg.groupImage);
    return GestureDetector(
     child: new ListTile(
       title: new Text(sg.groupDisplay, style: _biggerFont),
       leading: new Image.memory(byte),
       contentPadding: EdgeInsets.all(16.0),
     ),
      onTap: () {
        Navigator.pushNamed(context, SurveyMetricPage.routeName,
            arguments: sg
        );
      },
    );

  }


}