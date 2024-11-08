import 'dart:math';

import 'package:flutter/material.dart';

class WavyBoxPainter extends CustomPainter {
  // TODO: add padding?
  // TODO: add fill color?
  final Text text;
  final Color borderColor;

  WavyBoxPainter({
    required this.text,
    required this.borderColor,
    super.repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = borderColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Calculate text size
    final textPainter = TextPainter(
      text: TextSpan(text: text.data, style: text.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    double textHeight = textPainter.height;

    final heightFactor = (textWidth / size.width);
    final nLines = heightFactor.ceil();
    textHeight = nLines * textHeight;

    const nHorizontalSegments = 10;
    final availableWidth = min(textWidth, size.width);
    final lengthSegment = (availableWidth / nHorizontalSegments).ceil();
    final nVerticalSegments = (textHeight / lengthSegment).ceil();

    const arcHeight = -10.0;
    const weight = 1.0;
    double lastX2 = 0.0;

    // TODO: Fix corners, maybe with [arcTo]?
    final path = Path()..moveTo(0, 0);

    // Upper left to upper right
    for (int i = 1; i <= nHorizontalSegments; i++) {
      final double x2 = i * lengthSegment / 1.0;
      path.conicTo(lastX2 + lengthSegment / 2, arcHeight, x2 / 1.0, 0, weight);
      lastX2 = x2;
    }

    // Upper right to lower right
    double lastY2 = 0;
    for (int i = 1; i <= nVerticalSegments; i++) {
      final double y2 = i * lengthSegment / 1.0;
      path.conicTo(lastX2 - arcHeight, lastY2 + lengthSegment / 2, lastX2, y2, weight);
      lastY2 = y2;
    }

    // Lower right to lower left
    for (int i = nHorizontalSegments - 1; i >= 0; i--) {
      final double x2 = i * lengthSegment / 1.0;
      path.conicTo(lastX2 - lengthSegment / 2, lastY2 - arcHeight, x2 / 1.0, lastY2, weight);
      lastX2 = x2;
    }

    // Lower left to upper right
    for (int i = nVerticalSegments - 1; i >= 0; i--) {
      final double y2 = i * lengthSegment / 1.0;
      path.conicTo(arcHeight, y2 + lengthSegment / 2, lastX2, y2, weight);
      lastY2 = y2;
    }

    // Draw the bubble
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
