import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartsurveys/constants/MyFont.dart';
import 'package:smartsurveys/models/Home.dart';
import 'package:smartsurveys/models/SurveyApp.dart';
import 'package:smartsurveys/widgets/LabeledRadio.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber.dart';
import 'package:smartsurveys/widgets/LabeledRadioInputNumber2.dart';
import 'package:smartsurveys/widgets/LabeledRadioList.dart';
import 'package:smartsurveys/widgets/LabeledTextNumber.dart';
import 'package:smartsurveys/widgets/PillShapedButton.dart';
import 'package:smartsurveys/widgets/SurveyBody.dart';

class Survey22 extends StatefulWidget {
  @override
  _Survey22State createState() => _Survey22State();
}

class _Survey22State extends State<Survey22> {
  Home home;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<SurveyApp>(context, listen: false);
    home = app.currentHome;

    return SurveyBody.build(
      context: context,
      title: "แบบสอบถาม",
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('22. รายได้เฉลี่ยของคนในครัวเรือนต่อปี',
                style: MyFont.h1Font),
          ),
          ListTile(
            title: Text(
              '22.1 ในรอบปีที่ผ่านมา ครัวเรือนนี้มีรายได้จากข้อใดข้อหนึ่ง หรือหลายข้อดังต่อไปนี้ หรือไม่',
              style: MyFont.h2Font,
            ),
          ),
          ListTile(
            title: Text(
              '1) รายได้จากอาชีพหลักของทุกคนในครัวเรือน',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42211"],
            onChanged: (String value) {
              setState(() {
                home.answer["42211"] = value;
                _calculateIncome();
              });
            },
          ),
          ListTile(
            title: Text(
              '2) รายได้จากอาชีพรอง/อาชีพเสริมของทุกคนในครัวเรือน',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42212"],
            onChanged: (String value) {
              setState(() {
                home.answer["42212"] = value;
                _calculateIncome();
              });
            },
          ),
          ListTile(
            title: Text(
              '3) รายได้อื่น ๆ ของทุกคนในครัวเรือน (เช่น ลูกหลานส่งเงินให้ ค่าเช่า ดอกเบี้ยเงินฝาก บำนาญ/เบี้ยยังชีพ เงินปันผลหุ้น/สหกรณ์ ฯลฯ',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42213"],
            onChanged: (String value) {
              setState(() {
                home.answer["42213"] = value;
                _calculateIncome();
              });
            },
          ),
          ListTile(
            title: Text(
              '4) รายได้ที่เกิดจากการทำ/การปลูก การเลี้ยงสัตว์และการหาไว้กินเอง  แล้วคิดคำนวณเป็นจำนวนเงินทั้งหมด',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42214"],
            onChanged: (String value) {
              setState(() {
                home.answer["42214"] = value;
                _calculateIncome();
              });
            },
          ),
          ListTile(
            title: Text(
              '5) รวมรายได้ทั้งหมดของครัวเรือน (รายได้จากข้อ 1)+2)+3)+4))',
              style: MyFont.h3Font,
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: LabeledTextNumber(
              label: "ปีละ ... บาท",
              groupValue: home.answer["42215"],
              onChanged: (String value) {},
            ),
          ),
          ListTile(
            title: Text(
              'จำนวนคนทั้งหมดของครัวเรือน',
              style: MyFont.h2Font,
            ),
          ),
          ListTile(
            title: Text(
              home.countMember().toString() + " คน",
              style: TextStyle(fontSize: 20.0, color: Colors.red),
            ),
          ),
          ListTile(
            title: Text(
              'ครัวเรือนมีรายได้เฉลี่ยคนละ',
              style: MyFont.h3Font,
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: LabeledTextNumber(
              label: "เฉลี่ย ... บาท",
              groupValue: home.answer["42216"],
              onChanged: (String value) {},
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ListTile(
            title: Text(
              '22.2 รายจ่ายของครัวเรือนในรอบปีที่ผ่านมา ครัวเรือนมีรายจ่ายในแต่ละด้าน ดังต่อไปนี้',
              style: MyFont.h2Font,
            ),
          ),
          ListTile(
            title: Text(
              '1) รายจ่ายที่เป็นต้นทุนการผลิต ค่าพันธุ์พืช/สัตว์ ค่าปุ๋ย/ยาฆ่าแมลง ค่าจ้าง/แรงงาน ค่าเช่าที่ดิน ค่าเครื่องจักร ค่าน้ำมัน ฯลฯ',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42221"],
            onChanged: (String value) {
              setState(() {
                home.answer["42221"] = value;
                _calculateExpense();
              });
            },
          ),
          ListTile(
            title: Text(
              '2) รายจ่ายในการอุปโภคบริโภคที่จำเป็น ได้แก่ ค่าอาหาร เสื้อผ้า ที่อยู่อาศัย ค่ายา/รักษาพยาบาล ค่าใช้จ่ายด้านการศึกษา ค่าเดินทาง ค่าน้ำ ค่าไฟ และค่าใช้จ่ายส่วนบุคคล (สบู่ ยาสีฟัน ฯลฯ)',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42222"],
            onChanged: (String value) {
              setState(() {
                home.answer["42222"] = value;
                _calculateExpense();
              });
            },
          ),
          ListTile(
            title: Text(
              '3) รายจ่ายในการอุปโภคบริโภคที่ไม่จำเป็น ได้แก่ ค่าบันเทิง หวย การพนัน บุหรี่ เหล้า ยาดอง น้ำอัดลม ขนมกินเล่น และสินค้าฟุ่มเฟือย ฯลฯ',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42223"],
            onChanged: (String value) {
              setState(() {
                home.answer["42223"] = value;
                _calculateExpense();
              });
            },
          ),
          ListTile(
            title: Text(
              '4) รายจ่ายในการชำระหนี้สิน (การชำระดอกเบี้ยรวมถึงการชำระเงินต้นในรอบปีที่ผ่านมา)',
              style: MyFont.h3Font,
            ),
          ),
          LabeledTextNumber(
            label: "ปีละ ... บาท",
            groupValue: home.answer["42224"],
            onChanged: (String value) {
              setState(() {
                home.answer["42224"] = value;
                _calculateExpense();
              });
            },
          ),
          ListTile(
            title: Text(
              '5) รวมรายจ่ายทั้งหมดของครัวเรือน (รายจ่ายจากข้อ 1)+2)+3)+4))',
              style: MyFont.h3Font,
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: LabeledTextNumber(
              label: "ปีละ ... บาท",
              groupValue: home.answer["42225"],
              onChanged: (String value) {},
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ListTile(
            title: Text(
              '22.3 การเข้าถึงแหล่งเงินทุน  คือ สามารถขอกู้เงินและได้รับเงินทุนในแหล่งเงินทุนต่าง ๆ ต่อไปนี้ กลุ่มออมทรัพย์เพื่อการผลิต สหกรณ์ ธนาคารเพื่อการเกษตรและสหกรณ์ ธนาคารออมสิน ธนาคารกรุงไทย ธนาคารอิสลาม ธนาคาร SME ธนาคารพาณิชย์อื่นๆ สถาบันการเงิน ที่ให้การสนับสนุนสินเชื่อภาคอุตสาหกรรม ร้านค้า พ่อค้า แม่ค้า นายทุน เงินทุนหมุนเวียนจากทางราชการ เป็นต้น *ข้อนี้ให้ครัวเรือนตอบเฉพาะแหล่งเงินทุนที่ขอกู้ตามข้อ 22.3.1  1) -9) แล้วจึงตอบในข้อ 22.3.2 ว่าครัวเรือนได้รับเงินกู้เพียงพอหรือไม่ หากครัวเรือนไม่ได้ขอกู้เงินจากแหล่งใดๆ ไม่ต้องตอบข้อนี้',
              style: MyFont.h2Font,
            ),
          ),
          ListTile(
            title: Text(
              '22.3.1 ครัวเรือนสามารถเข้าถึงแหล่งเงินทุนดังต่อไปนี้ หรือไม่ (กรณีไม่กู้เงินข้ามไป ข้อ 22.4)',
              style: MyFont.h3Font,
            ),
          ),
          LabeledRadioList(
            children: [
              RadioItem('กู้', "1"),
              RadioItem("ไม่กู้ (ข้ามไปข้อ 22.4)", "0"),
            ],
            groupValue: home.answer["422310"],
            onChanged: (String value) {
              setState(() {
                home.answer["422310"] = value;
              });
            },
          ),
          Visibility(
            visible: home.answer["422310"] == "1",
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '1) กลุ่มออมทรัพย์เพื่อการผลิต',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422311"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422311"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422311"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422311"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '2) สหกรณ์',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422312"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422312"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422312"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422312"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '3) ธนาคารเพื่อการเกษตรและสหกรณ์',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422313"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422313"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422313"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422313"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '4) ธนาคารออมสิน/ธนาคารกรุงไทย/ธนาคารอิสลาม/ธนาคาร SME',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422314"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422314"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422314"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422314"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '5) ธนาคารพาณิชย์อื่นๆ',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422315"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422315"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422315"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422315"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '6) สถาบันการเงินที่ให้การสนับสนุนสินเชื่อภาคอุตสาหกรรม',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422316"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422316"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422316"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422316"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '7) ร้านค้า/พ่อค้า/แม่ค้า/นายทุน',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422317"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422317"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422317"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422317"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '8) เงินทุนหมุนเวียนจากทางราชการ (เช่น กองทุนหมู่บ้าน/ชุมชน 1 ล้านบาท กองทุนฟื้นฟูเกษตรกร เงินกระตุ้นเศรษฐกิจ 1 แสนบาท โครงการ กข.คจ. กองทุนพัฒนาบทบาทสตรี ฯลฯ)',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422318"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422318"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422318"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422318"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '9) อื่นๆ ระบุ ...',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadioInputNumber(
                  label: 'เข้าถึง ระบุ ... บาท',
                  value: "1",
                  groupValue: home.answer["422319"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422319"] = value;
                    });
                  },
                ),
                LabeledRadio(
                  label: 'เข้าไม่ถึง',
                  value: "0",
                  groupValue: home.answer["422319"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422319"] = value;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    '22.3.2 ครัวเรือนได้รับเงินกู้อย่างเพียงพอ หรือไม่',
                    style: MyFont.h3Font,
                  ),
                ),
                LabeledRadio(
                  label: 'เพียงพอ',
                  value: "1",
                  groupValue: home.answer["422319"],
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422319"] = value;
                    });
                  },
                ),
                LabeledRadioInputNumber(
                  label: 'ไม่เพียงพอ ระบุจำนวนที่ต้องการ ... บาท',
                  value: "0",
                  groupValue: home.answer["422319"],
                  question: "จำนวน",
                  unit: "บาท",
                  onChanged: (String value) {
                    setState(() {
                      home.answer["422319"] = value;
                    });
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              '22.4 หนี้สินของครัวเรือน หนี้นอกระบบ หมายถึง หนี้ที่กู้ยืมจากบุคคลและสถาบันต่างๆที่ไม่ใช่ธนาคารหรือสถาบันการเงินที่ถูกต้องตามกฎหมาย เช่น นายทุน พ่อค้า หรือกลุ่มบุคคลที่ปล่อยเงินกู้ดอกเบี้ยสูงกว่าที่กฎหมายกำหนด',
              style: MyFont.h2Font,
            ),
          ),
          ListTile(
            title: Text(
              '1) ครัวเรือนนี้ มีหนี้ผ่านสถาบันการเงิน',
              style: MyFont.h3Font,
            ),
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["42241"],
            onChanged: (String value) {
              setState(() {
                home.answer["42241"] = value;
              });
            },
          ),
          LabeledRadioInputNumber2(
            label: 'มี ... คน ... บาท',
            value: "1",
            groupValue: home.answer["42241"],
            question: "จำนวน",
            unit: "คน",
            unit2: "บาท",
            onChanged: (String value) {
              setState(() {
                home.answer["42241"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '2) ครัวเรือนนี้ มีหนี้สินของกองทุนชุมชน',
              style: MyFont.h3Font,
            ),
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["42242"],
            onChanged: (String value) {
              setState(() {
                home.answer["42242"] = value;
              });
            },
          ),
          LabeledRadioInputNumber2(
            label: 'มี ... คน ... บาท',
            value: "1",
            groupValue: home.answer["42242"],
            question: "จำนวน",
            unit: "คน",
            unit2: "บาท",
            onChanged: (String value) {
              setState(() {
                home.answer["42242"] = value;
              });
            },
          ),
          ListTile(
            title: Text(
              '3) ครัวเรือนนี้ มีหนี้นอกระบบ',
              style: MyFont.h3Font,
            ),
          ),
          LabeledRadio(
            label: 'ไม่มี',
            value: "0",
            groupValue: home.answer["42243"],
            onChanged: (String value) {
              setState(() {
                home.answer["42243"] = value;
              });
            },
          ),
          LabeledRadioInputNumber2(
            label: 'มี ... คน ... บาท',
            value: "1",
            groupValue: home.answer["42243"],
            question: "จำนวน",
            unit: "คน",
            unit2: "บาท",
            onChanged: (String value) {
              setState(() {
                home.answer["42243"] = value;
              });
            },
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              PillShapedButton(
                title: "ย้อนกลับ",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context)
                      .popAndPushNamed("/survey", arguments: 21);
                },
              ),
              SizedBox(width: 20.0),
              PillShapedButton(
                title: "ถัดไป",
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final repo = app.storage;
                  await repo.addToWaiting(home);
                  Navigator.of(context)
                      .popAndPushNamed("/survey", arguments: 23);
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  int intOrDefault(String a) {
    if (a == null || a.isEmpty) return 0;
    return int.tryParse(a);
  }

  void _calculateIncome() {
    int c = intOrDefault(home.answer["42211"]) +
        intOrDefault(home.answer["42212"]) +
        intOrDefault(home.answer["42213"]) +
        intOrDefault(home.answer["42214"]);
    home.answer["42215"] = c.toString();
    home.answer["42216"] = (c / home.countMember()).floor().toString();
  }

  void _calculateExpense() {
    int c = intOrDefault(home.answer["42221"]) +
        intOrDefault(home.answer["42222"]) +
        intOrDefault(home.answer["42223"]) +
        intOrDefault(home.answer["42224"]);
    home.answer["42225"] = c.toString();
  }
}
