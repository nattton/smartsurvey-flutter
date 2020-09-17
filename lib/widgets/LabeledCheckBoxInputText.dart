import 'package:flutter/material.dart';

class LabeledCheckBoxInputText extends StatefulWidget {
  LabeledCheckBoxInputText({
    key,
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
    this.question,
    this.unit = "",
    this.limit = 0,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final groupValue;
  final value;
  final Function onChanged;
  final String question;
  final String unit;
  final int limit;

  @override
  _LabeledCheckBoxInputTextState createState() =>
      _LabeledCheckBoxInputTextState(label: label);
}

class _LabeledCheckBoxInputTextState extends State<LabeledCheckBoxInputText> {
  String label;
  String value;

  _LabeledCheckBoxInputTextState({this.label});

  final TextEditingController _valueController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.groupValue != null) {
      List<String> ans = widget.groupValue.toString().split(",");
      if (ans[0] == "1") {
        value = widget.groupValue;
        _valueController.text = ans[1];
        label = widget.label.replaceAll("...", ans[1]);
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
              value: value == widget.groupValue,
              onChanged: (newValue) {
                _showDialog(context);
              },
            ),
            Text(label),
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
            content: Row(
              children: [
                SizedBox(
                    width: 140,
                    child: TextField(
                      controller: _valueController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: '...',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    )),
                SizedBox(width: 8.0),
                Flexible(child: Text(widget.unit)),
              ],
            ),
            actions: [
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        widget.onChanged("");
                        Navigator.of(context).pop();
                      },
                      child: Text("ยกเลิก")),
                  FlatButton(
                      child: Text("ตกลง"),
                      onPressed: () {
                        if (_valueController.text == "") return;

                        setState(() {
                          value = "1," + _valueController.text;
                          label = widget.label
                              .replaceAll("...", _valueController.text);
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
