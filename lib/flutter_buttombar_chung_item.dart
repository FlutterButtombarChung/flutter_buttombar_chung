import 'package:flutter/material.dart';

class MyButtombarChungItem extends FlutterButtombarChungItem {
  MyButtombarChungItem({
    required Widget child,
    String? label,
    TextStyle? labelStyle,
    IconData? icon,
    required String title,
  }) : super(
            child: child,
            label: label,
            labelStyle: labelStyle,
            icon: icon,
            title: title);
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
