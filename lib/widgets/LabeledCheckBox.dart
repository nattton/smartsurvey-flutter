import 'package:flutter/material.dart';

class LabeledCheckBox extends StatelessWidget {
  const LabeledCheckBox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) onChanged(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (newValue) {
                if (onChanged != null) onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
