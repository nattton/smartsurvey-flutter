import 'package:flutter/material.dart';

import 'LabeledRadio.dart';

class RadioItem {
  RadioItem(this.label, this.value);
  final String label;
  final String value;
}

class LabeledRadioList extends StatelessWidget {
  const LabeledRadioList({
    this.children,
    this.padding,
    this.groupValue,
    this.onChanged,
  });

  final List<RadioItem> children;
  final EdgeInsets padding;
  final groupValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: children
            .map((e) => LabeledRadio(
                  label: e.label,
                  value: e.value,
                  groupValue: groupValue,
                  onChanged: (String value) {
                    onChanged(value);
                  },
                ))
            .toList());
  }
}
