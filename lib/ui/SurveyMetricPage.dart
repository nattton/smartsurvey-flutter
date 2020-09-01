import 'package:flutter/material.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/database/QueryCtr.dart';
import 'package:smartsurveys/models/SurveyMetric.dart';
import 'package:smartsurveys/models/SurveyGroup.dart';
import 'package:smartsurveys/ui/SurveyPage.dart';

class SurveyMetricPage extends StatefulWidget {
  static String routeName = 'surveymetric-page';

  @override
  _SurveyMetricPageState createState() => _SurveyMetricPageState();
}

class _SurveyMetricPageState extends State<SurveyMetricPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  QueryCtr _query = QueryCtr();

  @override
  Widget build(BuildContext context) {
    final SurveyGroup sg = ModalRoute.of(context).settings.arguments;
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
          Navigator.pushNamed(context, SurveyPage.routeName, arguments: sm);
        });
  }
}
