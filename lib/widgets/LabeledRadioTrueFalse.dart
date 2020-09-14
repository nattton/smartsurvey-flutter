import 'package:flutter/material.dart';

import 'LabeledRadio.dart';

class LabeledRadioTrueFalse extends StatelessWidget {
  const LabeledRadioTrueFalse({
    this.labelTrue,
    this.labelFalse,
    this.padding,
    this.groupValue,
    this.onChanged,
  });

  final String labelTrue;
  final String labelFalse;
  final EdgeInsets padding;
  final groupValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledRadio(
          label: labelTrue,
          value: "1",
          groupValue: groupValue,
          onChanged: (String value) {
            onChanged(value);
          },
        ),
        LabeledRadio(
          label: labelFalse,
          value: "0",
          groupValue: groupValue,
          onChanged: (String value) {
            onChanged(value);
          },
        )
      ],
    );
  }
}
