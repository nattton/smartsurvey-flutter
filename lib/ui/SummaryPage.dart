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
  List<String> results = List();

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;
    _calculateSummary(home);

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
                    getResult(1)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "2. เด็กแรกเกิดได้กินนมแม่อย่างเดียวอย่างน้อย 6 เดือนแรกติดต่อกัน",
                        style: MyFont.h3Font),
                    getResult(2)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "3. เด็กแรกเกิดถึง 12 ปี ได้รับวัคซีนป้องกันโรคครบตามตารางสร้างเสริมภูมิคุ้มกันโรค",
                        style: MyFont.h3Font),
                    getResult(3)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "4. ครัวเรือนกินอาหารถูกสุขลักษณะ ปลอดภัย และได้มาตรฐาน",
                        style: MyFont.h3Font),
                    getResult(4)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "5. ครัวเรือนมีการใช้ยาเพื่อบำบัด บรรเทาอาการเจ็บป่วยเบื้องต้นอย่างเหมาะสม",
                        style: MyFont.h3Font),
                    getResult(5)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("6. คนอายุ 35 ปีขึ้นไป ได้รับการตรวจสุขภาพประจำปี",
                        style: MyFont.h3Font),
                    getResult(6)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "7. คนอายุ 6 ปีขึ้นไป ออกกำลังกายอย่างน้อยสัปดาห์ละ 3 วัน ๆ ละ 30 นาที",
                        style: MyFont.h3Font),
                    getResult(7)
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
                    getResult(8)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "9. ครัวเรือนมีน้ำสะอาดสำหรับดื่มและบริโภคเพียงพอตลอดปี อย่างน้อยคนละ 5 ลิตรต่อวัน",
                        style: MyFont.h3Font),
                    getResult(9)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "10. ครัวเรือนมีน้ำใช้เพียงพอตลอดปี อย่างน้อยคนละ 45 ลิตรต่อวัน",
                        style: MyFont.h3Font),
                    getResult(10)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "11. ครัวเรือนมีการจัดบ้านเรือนเป็นระเบียบเรียบร้อย สะอาด และถูกสุขลักษณะ",
                        style: MyFont.h3Font),
                    getResult(11)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("12. ครัวเรือนไม่ถูกรบกวนจากมลพิษ",
                        style: MyFont.h3Font),
                    getResult(12)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "13. ครัวเรือนมีการป้องกันอุบัติภัย และภัยธรรมชาติอย่างถูกวิธี",
                        style: MyFont.h3Font),
                    getResult(13)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("14. ครัวเรือนมีความปลอดภัยในชีวิตและทรัพย์สิน",
                        style: MyFont.h3Font),
                    getResult(14)
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
                    getResult(15)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("16. เด็กอายุ 6 - 14 ปี ได้รับการศึกษาภาคบังคับ 9 ปี",
                        style: MyFont.h3Font),
                    getResult(16)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("17. เด็กจบชั้น ม.3 ได้เรียนต่อชั้น ม.4 หรือเทียบเท่า",
                        style: MyFont.h3Font),
                    getResult(17)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "18. คนในครัวเรือนที่จบการศึกษาภาคบังคับ 9 ปี ที่ไม่ได้เรียนต่อและยังไม่มีงานทำ ได้รับการฝึกอบรมด้านอาชีพ",
                        style: MyFont.h3Font),
                    getResult(18)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "19. คนอายุ 15 - 59 ปี อ่าน เขียนภาษาไทย และคิดเลขอย่างง่ายได้",
                        style: MyFont.h3Font),
                    getResult(19)
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
                    getResult(20)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("21. คนอายุ 60 ปี ขึ้นไปมีอาชีพและรายได้",
                        style: MyFont.h3Font),
                    getResult(21)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("22. รายได้เฉลี่ยของคนในครัวเรือนต่อปี",
                        style: MyFont.h3Font),
                    getResult(22)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("23. ครัวเรือนมีการเก็บออมเงิน", style: MyFont.h3Font),
                    getResult(23)
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
                    getResult(24)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("25. คนในครัวเรือนไม่สูบบุหรี", style: MyFont.h3Font),
                    getResult(25)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "26. คนอายุ 6 ปีขึ้นไป ปฏิบัติกิจกรรมทางศาสนาอย่างน้อยสัปดาห์ละ 1 ครั้ง",
                        style: MyFont.h3Font),
                    getResult(26)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "27. ผู้สูงอายุได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ หรือภาคเอกชน",
                        style: MyFont.h3Font),
                    getResult(27)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "28. ผู้พิการได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ หรือภาคเอกชน",
                        style: MyFont.h3Font),
                    getResult(28)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "29. ผู้ป่วยโรคเรื้อรังได้รับการดูแลจากครอบครัว ชุมชน ภาครัฐ  หรือภาคเอกชน",
                        style: MyFont.h3Font),
                    getResult(29)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text(
                        "30. ครัวเรือนมีส่วนร่วมทำกิจกรรมสาธารณะเพื่อประโยชน์ของชุมชนหรือท้องถิ่น",
                        style: MyFont.h3Font),
                    getResult(30)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("31. ครอบครัวมีความอบอุ่น", style: MyFont.h3Font),
                    getResult(31)
                  ]),
                  _rowSpace(),
                  TableRow(children: [
                    Text("คะแนนความสุข", style: MyFont.h2Font),
                    Center(
                      child: _pass(home.satisfaction.toString()),
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
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context).pushNamed("/waiting");
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
    return TableRow(children: [SizedBox(height: 15), SizedBox(height: 15)]);
  }

  int intOrDefault(String a) {
    if (a == null || a.isEmpty) return 0;
    return int.tryParse(a);
  }

  Widget _noAnwser(String label) {
    return Center(
        child: Text(
      label,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
    ));
  }

  Widget _pass(String label) {
    return Center(
        child: Text(
      label,
      style: TextStyle(color: Colors.greenAccent[700], fontSize: 16.0),
    ));
  }

  Widget _notPass(String label) {
    return Center(
        child: Text(
      label,
      style: TextStyle(color: Colors.redAccent[700], fontSize: 16.0),
    ));
  }

  Widget getResult(int position) {
    try {
      String ans = results.elementAt(position - 1);
      if (position == 22 || position == 23) {
        if (intOrDefault(ans) < 38000) {
          return _notPass(ans);
        } else {
          return _pass(ans);
        }
      }

      switch (ans) {
        case "1":
          return _pass("ผ่าน");
        case "0":
          return _notPass("ไม่ผ่าน");
        case "-":
          return _noAnwser("-");
          break;
        default:
          return _noAnwser("-");
      }
    } on RangeError {
      return _noAnwser("-");
    }
  }

  void _calculateSummary(Home home) {
    results = List();

    switch (home.answer["1111"].substring(0, 1)) {
      case "1":
        results.add((home.answer["1121"] == "1") ? "1" : "0");
        break;
      default:
        results.add("-");
    }

    switch (home.answer["1241"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["1321"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    if (home.answer["1411"] == "1" &&
        home.answer["1421"] == "1" &&
        home.answer["1431"] == "1" &&
        home.answer["1441"] == "1") {
      results.add("1");
    } else if (home.answer["1411"] == "-" ||
        home.answer["1421"] == "-" ||
        home.answer["1431"] == "-" ||
        home.answer["1441"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    if (home.answer["1511"] == "1" &&
        home.answer["1521"] == "1" &&
        home.answer["1531"] == "1" &&
        home.answer["1541"] == "1") {
      results.add("1");
    } else if (home.answer["1511"] == "-" ||
        home.answer["1521"] == "-" ||
        home.answer["1531"] == "-" ||
        home.answer["1541"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    switch (home.answer["1641"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["1711"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        if (home.answer["1712"].startsWith("1") ||
            home.answer["1713"].startsWith("1") ||
            home.answer["1714"].startsWith("1")) {
          results.add("0");
        } else {
          results.add("-");
        }
        break;
      default:
        results.add("0");
    }

    if (home.answer["2811"] == "1" && home.answer["2821"] == "1") {
      results.add("1");
    } else if (home.answer["2811"] == "-" || home.answer["2821"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    switch (home.answer["2911"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["21011"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    if (home.answer["21111"] == "1" &&
        home.answer["21121"] == "1" &&
        home.answer["21131"] == "1" &&
        home.answer["21141"] == "1" &&
        home.answer["21151"] == "1" &&
        home.answer["21161"] == "1" &&
        home.answer["21171"] == "1" &&
        home.answer["21181"] == "1") {
      results.add("1");
    } else if (home.answer["21111"] == "-" ||
        home.answer["21121"] == "-" ||
        home.answer["21131"] == "-" ||
        home.answer["21141"] == "-" ||
        home.answer["21151"] == "-" ||
        home.answer["21161"] == "-" ||
        home.answer["21171"] == "-" ||
        home.answer["21181"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    if (home.answer["21211"] == "0" &&
        home.answer["21221"] == "0" &&
        home.answer["21231"] == "0" &&
        home.answer["21241"] == "0" &&
        home.answer["21251"] == "0" &&
        home.answer["21261"] == "0") {
      results.add("1");
    } else if (home.answer["21211"] == "-" ||
        home.answer["21221"] == "-" ||
        home.answer["21231"] == "-" ||
        home.answer["21241"] == "-" ||
        home.answer["21251"] == "-" ||
        home.answer["21261"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    if (home.answer["21311"] == "1" &&
        home.answer["21312"] == "1" &&
        home.answer["21313"] == "1" &&
        home.answer["21314"] == "1") {
      results.add("1");
    } else if (home.answer["21311"] == "-" ||
        home.answer["21312"] == "-" ||
        home.answer["21313"] == "-" ||
        home.answer["21314"] == "-" ||
        home.answer["21321"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    if (home.answer["21411"] == "0" &&
        home.answer["21421"] == "0" &&
        home.answer["21431"] == "0" &&
        home.answer["21441"] == "0" &&
        home.answer["21451"] == "0" &&
        home.answer["21461"] == "0") {
      results.add("1");
    } else if (home.answer["21411"] == "-" ||
        home.answer["21421"] == "-" ||
        home.answer["21431"] == "-" ||
        home.answer["21441"] == "-" ||
        home.answer["21451"] == "-" ||
        home.answer["21461"] == "-") {
      results.add("-");
    } else {
      results.add("0");
    }

    switch (home.answer["31521"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["31621"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["31721"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["31821"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["31921"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["42021"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        if (home.answer["42022"].startsWith("1") ||
            home.answer["42023"].startsWith("1")) {
          results.add("0");
        } else {
          results.add("-");
        }

        break;
      default:
        results.add("0");
    }

    switch (home.answer["42121"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        if (home.answer["42122"].startsWith("1") ||
            home.answer["42123"].startsWith("1")) {
          results.add("0");
        } else {
          results.add("-");
        }

        break;
      default:
        results.add("0");
    }

    if (home.answer["42216"] != "-") {
      results.add(home.answer["42216"]);
    } else {
      results.add("0");
    }

    if (home.answer["42321"] != "-") {
      results.add(home.answer["42321"]);
    } else {
      results.add("0");
    }

    switch (home.answer["52411"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        if (home.answer["52412"].startsWith("1") ||
            home.answer["52413"].startsWith("1") ||
            home.answer["52414"].startsWith("1") ||
            home.answer["52415"].startsWith("1")) {
          results.add("0");
        } else {
          results.add("-");
        }

        break;
      default:
        results.add("0");
    }

    switch (home.answer["52511"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["52611"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["52721"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["52831"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["52921"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["5301"]) {
      case "1":
        results.add("1");
        break;
      case "-":
        results.add("-");
        break;
      default:
        results.add("0");
    }

    switch (home.answer["53111"]) {
      case "1":
        if (home.answer["53112"].startsWith("1") ||
            home.answer["53113"].startsWith("1") ||
            home.answer["53114"].startsWith("1")) {
          results.add("1");
        } else if (home.answer["53112"].startsWith("-") ||
            home.answer["53113"].startsWith("-") ||
            home.answer["53114"].startsWith("-")) {
          results.add("-");
        } else {
          results.add("0");
        }
        break;
      case "-":
        if (home.answer["53121"].startsWith("1") ||
            home.answer["53122"].startsWith("1")) {
          results.add("1");
        } else if (home.answer["53121"].startsWith("-") ||
            home.answer["53122"].startsWith("-")) {
          results.add("-");
        } else {
          results.add("0");
        }
        break;
      default:
        results.add("-");
    }

    home.answer["summary"] = results.join(",");
  }
}
