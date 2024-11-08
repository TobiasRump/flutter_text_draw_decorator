import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/underline/classes/horizontal_offset.dart';

abstract class UnderlinePainter extends CustomPainter {
  final Color color;
  final TextStyle? textStyle;
  final double strokeWidth;
  final HorizontalOffset horizontalOffset;
  UnderlinePainter({
    required this.color,
    required this.strokeWidth,
    this.textStyle,
    this.horizontalOffset = const HorizontalOffset(0, 0),
  });
}
