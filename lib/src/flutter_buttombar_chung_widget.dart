import 'package:flutter/material.dart';

class FlutterButtombarChungWidget extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final String? label;
  final TextStyle? labelStyle;

  const FlutterButtombarChungWidget({
    super.key,
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    this.label,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap(index),
        child: _buildItem(),
      ),
    );
  }

  Widget _buildItem() {
    if (label == null) {
      return Column(
        children: [
          Expanded(child: _buildIcon()),
          const SizedBox(height: 0), // Removed Platform.isIOS check
        ],
      );
    }
    return Column(
      children: [
        Expanded(flex: 2, child: _buildIcon()),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(label ?? '', style: labelStyle),
          ),
        ),
        const SizedBox(height: 10.0), // Removed Platform.isIOS check
      ],
    );
  }

  Widget _buildIcon() {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Transform.translate(
      offset: Offset(
        0,
        difference < 1.0 / length ? verticalAlignment * 40 : 0,
      ),
      child: Opacity(
        opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
        child: child,
      ),
    );
  }
}
