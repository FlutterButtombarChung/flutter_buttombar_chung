import 'package:flutter/material.dart';

class MyButtombarChungItem extends FlutterButtombarChungItem {
  MyButtombarChungItem({
    required super.child,
    super.label,
    super.labelStyle,
    super.icon,
    required super.title,
  });
}

class FlutterButtombarChungItem {
  final Widget child;
  final String? label;
  final TextStyle? labelStyle;
  final IconData? icon;
  final String title;

  FlutterButtombarChungItem({
    required this.child,
    this.label,
    this.labelStyle,
    this.icon,
    required this.title,
  });
}
