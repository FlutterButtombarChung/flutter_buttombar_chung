import 'dart:io';

import 'package:flutter_buttombar_chung/flutter_buttombar_chung_item.dart';
import 'package:flutter_buttombar_chung/src/flutter_buttombar_chung_widget.dart';
import 'package:flutter/material.dart';

import 'src/flutter_buttombar_chung_painter.dart';

typedef _LetIndexPage = bool Function(int value);

class FlutterButtomBarChung extends StatefulWidget {
  /// Defines the appearance of the [FlutterButtomBarChungItem] list that are
  /// arrayed within the bottom navigation bar.
  final List<FlutterButtombarChungItem> items;

  /// The index into [items] for the current active [FlutterButtomBarChungItem].
  final int index;

  /// The color of the [FlutterButtomBarChung] itself, default Colors.white.
  final Color color;

  /// The background color of floating button, default same as [color] attribute.
  final Color? buttonBackgroundColor;

  /// The color of [FlutterButtomBarChung]'s background, default Colors.blueAccent.
  final Color backgroundColor;

  /// Called when one of the [items] is tapped.
  final ValueChanged<int>? onTap;

  /// Function which takes page index as argument and returns bool. If function
  /// returns false then page is not changed on button tap. It returns true by
  /// default.
  // ignore: library_private_types_in_public_api
  final _LetIndexPage letIndexChange;

  /// Curves interpolating button change animation, default Curves.easeOut.
  final Curve animationCurve;

  /// Duration of button change animation, default Duration(milliseconds: 600).
  final Duration animationDuration;

  /// Height of [FlutterButtomBarChung].
  final double height;

  /// Padding of icon in floating button.
  final double iconPadding;

  /// Check if [FlutterButtomBarChung] has label.
  final bool hasLabel;

  FlutterButtomBarChung({
    super.key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    // ignore: library_private_types_in_public_api
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.iconPadding = 12.0,
    double? height,
  })  : assert(items.isNotEmpty),
        assert(0 <= index && index < items.length),
        letIndexChange = letIndexChange ?? ((_) => true),
        height = height ?? (Platform.isAndroid ? 70.0 : 80.0),
        hasLabel = items.any((item) => item.label != null);

  @override
  FlutterButtomBarChungState createState() => FlutterButtomBarChungState();
}

class FlutterButtomBarChungState extends State<FlutterButtomBarChung>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  late double _pos;
  late Widget _icon;
  late AnimationController _animationController;
  late int _length;
  int _endingIndex = 0;
  double _buttonHide = 0;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index].child;
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = widget.items[_endingIndex].child;
        }
        _buttonHide =
            (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(FlutterButtomBarChung oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Selected button
          Positioned(
            bottom: widget.height - 105.0,
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: Offset(0, (_buttonHide - 1) * 80),
                child: Material(
                  color: widget.buttonBackgroundColor ?? widget.color,
                  type: MaterialType.circle,
                  child: Padding(
                    padding: EdgeInsets.all(widget.iconPadding),
                    child: _icon,
                  ),
                ),
              ),
            ),
          ),
          // Background
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(
              painter: FlutterButtombarChungPainter(
                startingLoc: _pos,
                itemsLength: _length,
                color: widget.color,
                textDirection: Directionality.of(context),
                hasLabel: widget.hasLabel,
              ),
              child: Container(height: widget.height),
            ),
          ),
          // Unselected buttons
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: widget.height,
              child: Row(
                children: widget.items.map((item) {
                  return FlutterButtombarChungWidget(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    label: item.label,
                    labelStyle: item.labelStyle,
                    child: Center(child: item.child),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index) || _animationController.isAnimating) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    });
  }
}
