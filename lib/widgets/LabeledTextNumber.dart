import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledTextNumber extends StatelessWidget {
  LabeledTextNumber({
    this.label,
    this.groupValue,
    this.onChanged,
  });

  final String label;
  final String groupValue;
  final Function onChanged;
  final TextEditingController _textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = groupValue;
    _textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textEditingController.text.length));
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
      child: TextField(
        controller: _textEditingController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
