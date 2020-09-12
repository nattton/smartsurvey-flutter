import 'package:flutter/material.dart';

class MyConstants extends InheritedWidget {
  static MyConstants of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyConstants>();

  const MyConstants({Widget child, Key key}): super(key: key, child: child);

  final h1Font = const TextStyle(fontSize: 18.0);
  final h2Font = const TextStyle(fontSize: 16.0);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}