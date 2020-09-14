import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
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
  ByteData _img = ByteData(0);
  var color = Colors.black;
  var strokeWidth = 3.0;
  final _sign = GlobalKey<SignatureState>();

  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context);
    home = app.currentHome;

    if (home.photoSignature != null) {
      _img = base64.decode(home.photoSignature).buffer.asByteData();
    }

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
              Text("กรุณลงลายมือชื่อด้านล่าง"),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                child: Container(
                  child: _img.buffer.lengthInBytes == 0
                      ? Container(
                          height: 200.0,
                          color: Colors.white,
                        )
                      : LimitedBox(
                          maxHeight: 200.0,
                          child: Image.memory(_img.buffer.asUint8List())),
                ),
                onTap: () {
                  _signaturePad(context);
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              PillShapedButton(
                title: "ส่งคำตอบ",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (_img.buffer.lengthInBytes == 0) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("กรุณาลงลายมือชื่อ"),
                          );
                        });
                    return;
                  }

                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context).pushNamed("/summary");
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }

  void _signaturePad(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("กรุณลงลายมือชื่อด้านล่าง"),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: LimitedBox(
                    maxHeight: 200.0,
                    child: Signature(
                      color: color,
                      key: _sign,
                      onSign: () {
                        final sign = _sign.currentState;
                        debugPrint(
                            '${sign.points.length} points in the signature');
                      },
                      strokeWidth: strokeWidth,
                    ),
                  ),
                ),
                color: Colors.black12,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            final sign = _sign.currentState;
                            //retrieve image data, do whatever you want with it (send to server, save locally...)
                            final image = await sign.getData();
                            var data = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            sign.clear();
                            final encoded =
                                base64.encode(data.buffer.asUint8List());
                            setState(() {
                              _img = data;
                              home.photoSignature =
                                  base64.encode(_img.buffer.asUint8List());
                            });
                            debugPrint("onPressed " + encoded);
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Text("Save")),
                      SizedBox(
                        width: 10.0,
                      ),
                      MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            final sign = _sign.currentState;
                            sign.clear();
                            setState(() {
                              _img = ByteData(0);
                            });
                            debugPrint("cleared");
                          },
                          child: Text("Clear")),
                    ],
                  ),
                ],
              )
            ]),
          );
        });
  }
}
