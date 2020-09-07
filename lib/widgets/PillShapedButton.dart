import 'package:flutter/material.dart';

class PillShapedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;

  const PillShapedButton({
    Key key,
    this.onPressed,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      color: color,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: onPressed,
    );
  }
}
