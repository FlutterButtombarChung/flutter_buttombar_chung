import 'package:flutter/material.dart';

abstract class FlutterButtombarChungItem {
  /// Icon of [FlutterButtombarChungItem].
  final Widget child;

  /// Text of [FlutterButtombarChungItem].
  final String? label;

  /// TextStyle for [label].
  final TextStyle? labelStyle;

  final IconData? icon;

  const FlutterButtombarChungItem({
    required this.child,
    this.label,
    this.labelStyle,
    this.icon
  });
}
