import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyMetric.dart';
import 'package:smartsurveys/models/SurveyGroup.dart';

class SurveyMetricPage extends StatefulWidget {
  final Home home;
  final SurveyGroup sg;
  const SurveyMetricPage({Key key, this.home, this.sg}) : super(key: key);

  @override
  _SurveyMetricPageState createState() =>
      _SurveyMetricPageState(home: home, sg: sg);
}

class _SurveyMetricPageState extends State<SurveyMetricPage> {
  final Home home;
  final SurveyGroup sg;
  _SurveyMetricPageState({this.home, this.sg});

  final _biggerFont = const TextStyle(fontSize: 18.0);
  QueryCtr _query = QueryCtr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(sg.groupDisplay),
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
                child: FutureBuilder<List>(
                  future: _query.getSurveyMetrics(sg.id),
                  initialData: List(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? new ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return _buildRow(snapshot.data[i]);
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ))));
  }

  Widget _buildRow(SurveyMetric sm) {
    return GestureDetector(
        child: new ListTile(
          title: new Text(sm.metricDisplay, style: _biggerFont),
          contentPadding: EdgeInsets.all(8.0),
        ),
        onTap: () {
          Navigator.of(context).pushNamed("/survey", arguments: sm.id);
        });
  }
}
