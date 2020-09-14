import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class SatisfactionPage extends StatefulWidget {
  @override
  _SatisfactionPageState createState() => _SatisfactionPageState();
}

class _SatisfactionPageState extends State<SatisfactionPage> {
  double _currentValue = 0;
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    home.satisfaction = (home.satisfaction == null) ? 0 : home.satisfaction;
    _currentValue = home.satisfaction?.toDouble();
    return SurveyBody.build(
        title: "ประเมินระดับความสุข",
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('คำอธิบาย', style: MyFont.h1Font),
              Text(
                  "ความสุข หมายถึง การรู้สึกดี มีความสุขกับชีวิต และอยากให้ความรู้ลึกนั้นคงอยู่ไม่หายไป",
                  style: MyFont.h2Font),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "ปัจจัยสำคัญที่มีผลต่อความสุข ให้พิจารณาจากสิ่งที่ครัวเรือนและชุมชนมีอยู่ เป็นอยู่",
                  style: MyFont.h2Font),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "ถ้าตัวเลข 0 - 10 แทนระดับความสุข (จากไม่มีความสุข = 0, มีความสุขน้อยที่สุด = 1, ไปหา มีความสุขมาก = 9, และมีความสุขมากที่สุด = 10",
                  style: MyFont.h2Font),
              SizedBox(
                height: 20.0,
              ),
              Text("คะแนน : " + _currentValue.toInt().toString(),
                  style: TextStyle(color: Colors.red, fontSize: 24.0)),
              Slider(
                  value: _currentValue,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: _currentValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentValue = value;
                      home.satisfaction = _currentValue.toInt();
                    });
                  }),
              SizedBox(
                height: 20.0,
              ),
              PillShapedButton(
                title: "ถัดไป",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context).pushNamed("/agreement");
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }
}
