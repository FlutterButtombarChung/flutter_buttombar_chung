import 'package:flutter/material.dart';

class MyButtombarChungItem extends FlutterButtombarChungItem {
  MyButtombarChungItem({
    required super.child,
    super.label,
    super.labelStyle,
    super.icon,
  });
}

class FlutterButtombarChungItem {
  final Widget child;
  final String? label;
  final TextStyle? labelStyle;
  final IconData? icon;

  FlutterButtombarChungItem({
    required this.child,
    this.label,
    this.labelStyle,
    this.icon,
  });
}
