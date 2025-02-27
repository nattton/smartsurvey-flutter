import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledCheckBoxInputNumber2 extends StatefulWidget {
  LabeledCheckBoxInputNumber2({
    key,
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
    this.question,
    this.unit = "",
    this.unit2 = "",
    this.limit = 0,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final groupValue;
  final value;
  final Function onChanged;
  final String question;
  final String unit;
  final String unit2;
  final int limit;

  @override
  _LabeledCheckBoxInputNumber2State createState() =>
      _LabeledCheckBoxInputNumber2State(label: label);
}

class _LabeledCheckBoxInputNumber2State
    extends State<LabeledCheckBoxInputNumber2> {
  String label;
  String value;

  _LabeledCheckBoxInputNumber2State({this.label});

  final TextEditingController _valueController = new TextEditingController();
  final TextEditingController _value2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.groupValue != null) {
      List<String> ans = widget.groupValue.toString().split(",");
      if (ans[0] == "1") {
        value = widget.groupValue;
        _valueController.text = ans[1];
        _value2Controller.text = ans[2];

        label = widget.label
            .replaceFirst("...", ans[1])
            .replaceFirst("...", ans[2]);
      }
    }
    return InkWell(
      onTap: () {
        if (value != widget.groupValue) _showDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value != null && value == widget.groupValue,
              onChanged: (newValue) {
                _showDialog(context);
              },
            ),
            Expanded(
              child: Text(label,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(widget.question),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  SizedBox(
                      width: 140,
                      child: TextField(
                          controller: _valueController,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'จำนวน',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ])),
                  SizedBox(width: 8.0),
                  Flexible(child: Text(widget.unit)),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 140,
                      child: TextField(
                          controller: _value2Controller,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'จำนวน',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ])),
                  SizedBox(width: 8.0),
                  Flexible(child: Text(widget.unit2)),
                ],
              ),
            ]),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        widget.onChanged("");
                        Navigator.of(context).pop();
                      },
                      child: Text("ยกเลิก")),
                  TextButton(
                      child: Text("ตกลง"),
                      onPressed: () {
                        if (_valueController.text == "" ||
                            _value2Controller.text == "") return;

                        setState(() {
                          label = widget.label
                              .replaceFirst("...", _valueController.text)
                              .replaceFirst("...", _value2Controller.text);
                          value = "1," +
                              _valueController.text +
                              "," +
                              _value2Controller.text;
                        });

                        widget.onChanged(value);
                        Navigator.of(context).pop();
                      })
                ],
              )
            ],
          );
        });
  }
}
