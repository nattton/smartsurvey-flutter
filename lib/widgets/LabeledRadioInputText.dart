import 'package:flutter/material.dart';

class LabeledRadioInputText extends StatefulWidget {
  LabeledRadioInputText({
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
  _LabeledRadioInputTextState createState() =>
      _LabeledRadioInputTextState(label: label, value: value);
}

class _LabeledRadioInputTextState extends State<LabeledRadioInputText> {
  String label;
  dynamic value;

  _LabeledRadioInputTextState({this.label, this.value});

  final TextEditingController _valueController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.groupValue != null) {
      List<String> ans = widget.groupValue.toString().split(",");
      if (ans[0] == widget.value) {
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
            Radio(
              groupValue: widget.groupValue,
              value: value,
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
            content: TextField(
              controller: _valueController,
              autofocus: false,
              decoration: InputDecoration(
                labelText: widget.unit,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("ยกเลิก")),
                  TextButton(
                      child: Text("ตกลง"),
                      onPressed: () {
                        if (_valueController.text == "") return;

                        setState(() {
                          label = widget.label
                              .replaceAll("...", _valueController.text);
                          Navigator.of(context).pop();
                          value = widget.value + "," + _valueController.text;
                        });
                        widget.onChanged(value);
                      })
                ],
              )
            ],
          );
        });
  }
}
