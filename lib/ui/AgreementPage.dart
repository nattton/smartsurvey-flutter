import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);
    home = app.currentHome;
    return SurveyBody.build(
        title: "ยินยอมให้ข้อมูล",
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                  "ข้าพเจ้ายินยอมให้กรมการพัฒนาชุมชนและหน่วยงานของรัฐสามารถนำข้อมูลไปใช้ประโยชน์ในการพัฒนาคุณภาพชีวิตและการบริหารราชการแผ่นดิน",
                  style: TextStyle(fontSize: 16.0)),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  "ข้าพเจ้าได้ตรวจสอบและรับทราบผลการจัดเก็บข้อมูลความจำเป็นพื้นฐาน (จปฐ.) ของครัวเรือนตนเอง และขอรับรองว่าได้มีการจัดเก็บข้อมูลที่ถูกต้องเป็นจริง พร้อมได้รับคำแนะนำเพื่อปรับปรุง/รักษามาตรฐานคุณภาพชีวิตของครัวเรือนจากผู้จัดเก็บข้อมูลแล้ว",
                  style: TextStyle(fontSize: 16.0)),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              PillShapedButton(
                title: "ถัดไป",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context).pushNamed("/survey");
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
