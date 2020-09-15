import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;

    return SurveyBody.build(
        title: "สรุปคุณภาพชีวิตของครัวเรือน",
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text("หมวดที่ 1 สุขภาพ", style: MyFont.h1Font),
              SizedBox(
                height: 20.0,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                columnWidths: {1: FractionColumnWidth(.2)},
                children: [
                  TableRow(children: [
                    Text("1. เด็กแรกเกิดมีน้ำหนัก 2,500 กรัม ขึ้นไป",
                        style: MyFont.h3Font),
                    _result1()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "2. เด็กแรกเกิดได้กินนมแม่อย่างเดียวอย่างน้อย 6 เดือนแรกติดต่อกัน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "3. เด็กแรกเกิดถึง 12 ปี ได้รับวัคซีนป้องกันโรคครบตามตารางสร้างเสริมภูมิคุ้มกันโรค",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "4. ครัวเรือนกินอาหารถูกสุขลักษณะ ปลอดภัย และได้มาตรฐาน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "5. ครัวเรือนมีการใช้ยาเพื่อบำบัด บรรเทาอาการเจ็บป่วยเบื้องต้นอย่างเหมาะสม",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("6. คนอายุ 35 ปีขึ้นไป ได้รับการตรวจสุขภาพประจำปี",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "7. คนอายุ 6 ปีขึ้นไป ออกกำลังกายอย่างน้อยสัปดาห์ละ 3 วัน ๆ ละ 30 นาที",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("หมวดที่ 2 สภาพแวดล้อม", style: MyFont.h1Font),
              SizedBox(
                height: 20.0,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                columnWidths: {1: FractionColumnWidth(.2)},
                children: [
                  TableRow(children: [
                    Text(
                        "8. ครัวเรือนมีความมั่นคงในที่อยู่อาศัยและบ้านมีสภาพคงทนถาวร",
                        style: MyFont.h3Font),
                    _result1()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "9. ครัวเรือนมีน้ำสะอาดสำหรับดื่มและบริโภคเพียงพอตลอดปี อย่างน้อยคนละ 5 ลิตรต่อวัน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "10. ครัวเรือนมีน้ำใช้เพียงพอตลอดปี อย่างน้อยคนละ 45 ลิตรต่อวัน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "11. ครัวเรือนมีการจัดบ้านเรือนเป็นระเบียบเรียบร้อย สะอาด และถูกสุขลักษณะ",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("12. ครัวเรือนไม่ถูกรบกวนจากมลพิษ",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "13. ครัวเรือนมีการป้องกันอุบัติภัย และภัยธรรมชาติอย่างถูกวิธี",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("14. ครัวเรือนมีความปลอดภัยในชีวิตและทรัพย์สิน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("หมวดที่ 3  การศึกษา", style: MyFont.h1Font),
              SizedBox(
                height: 20.0,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                columnWidths: {1: FractionColumnWidth(.2)},
                children: [
                  TableRow(children: [
                    Text(
                        "15. เด็กอายุ 3 - 5 ปี ได้รับการบริการเลี้ยงดูเตรียมความพร้อมก่อนวัยเรียน",
                        style: MyFont.h3Font),
                    _result1()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("16. เด็กอายุ 6 - 14 ปี ได้รับการศึกษาภาคบังคับ 9 ปี",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("17. เด็กจบชั้น ม.3 ได้เรียนต่อชั้น ม.4 หรือเทียบเท่า",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "18. คนในครัวเรือนที่จบการศึกษาภาคบังคับ 9 ปี ที่ไม่ได้เรียนต่อและยังไม่มีงานทำ ได้รับการฝึกอบรมด้านอาชีพ",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "19. คนอายุ 15 - 59 ปี อ่าน เขียนภาษาไทย และคิดเลขอย่างง่ายได้",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("หมวดที่ 4 การมีงานทำและรายได้", style: MyFont.h1Font),
              SizedBox(
                height: 20.0,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                columnWidths: {1: FractionColumnWidth(.2)},
                children: [
                  TableRow(children: [
                    Text("20. คนอายุ 15 - 59 ปี มีอาชีพและรายได้",
                        style: MyFont.h3Font),
                    _result1()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("21. คนอายุ 60 ปี ขึ้นไปมีอาชีพและรายได้",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("22. รายได้เฉลี่ยของคนในครัวเรือนต่อปี",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("23. ครัวเรือนมีการเก็บออมเงิน", style: MyFont.h3Font),
                    _result2()
                  ]),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("หมวดที่ 5 ค่านิยม", style: MyFont.h1Font),
              SizedBox(
                height: 20.0,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                columnWidths: {1: FractionColumnWidth(.2)},
                children: [
                  TableRow(children: [
                    Text("24. คนในครัวเรือนไม่ดื่มสุรา", style: MyFont.h3Font),
                    _result1()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("25. คนในครัวเรือนไม่สูบบุหรี", style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "26. คนอายุ 6 ปีขึ้นไป ปฏิบัติกิจกรรมทางศาสนาอย่างน้อยสัปดาห์ละ 1 ครั้ง",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "27. ผู้สูงอายุได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ หรือภาคเอกชน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "28. ผู้พิการได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ หรือภาคเอกชน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "29. ผู้ป่วยโรคเรื้อรังได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ  หรือภาคเอกชน",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "30. ครัวเรือนมีส่วนร่วมทำกิจกรรมสาธารณะเพื่อประโยชน์ของชุมชนหรือท้องถิ่น",
                        style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("31. ครอบครัวมีความอบอุ่น", style: MyFont.h3Font),
                    _result2()
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("คะแนนความสุข", style: MyFont.h2Font),
                    Center(
                      child: Text(home.satisfaction.toString(),
                          style: MyFont.h2Font),
                    )
                  ]),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              PillShapedButton(
                title: "ส่งคำตอบ",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
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

  TableRow _rowSpace() {
    return TableRow(children: [
      SizedBox(height: 15), //SizeBox Widget
      SizedBox(height: 15)
    ]);
  }

  Widget _noAnwser() {
    return Center(
        child: Text(
      "-",
      style: TextStyle(color: Colors.black, fontSize: 16.0),
    ));
  }

  Widget _pass() {
    return Center(
        child: Text(
      "ผ่าน",
      style: TextStyle(color: Colors.greenAccent[700], fontSize: 16.0),
    ));
  }

  Widget _notPass() {
    return Center(
        child: Text(
      "ไม่ผ่าน",
      style: TextStyle(color: Colors.redAccent[700], fontSize: 16.0),
    ));
  }

  Widget _result1() {
    return _pass();
  }

  Widget _result2() {
    return _notPass();
  }
}
