import 'package:flutter/material.dart';

class LabeledCheckBox extends StatelessWidget {
  const LabeledCheckBox({
    this.label,
    this.padding,
    this.value,
    this.groupValue,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final value;
  final groupValue;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          groupValue != value ? onChanged(value) : onChanged("");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value != null && value == groupValue,
              onChanged: (newValue) {
                if (onChanged != null) {
                  newValue ? onChanged(value) : onChanged("");
                }
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
}
