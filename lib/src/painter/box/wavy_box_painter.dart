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

  double _calcAspectRatio(double width, double height) {
    return 0;
  }

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
    final textHeight = textPainter.height;

    final path = Path();

    path.moveTo(0, 0);
    int nHorizontalSegments = 10;
    int lengthSegment = (textWidth / nHorizontalSegments).ceil();
    double arcHeight = -10;
    double weight = 1;
    double lastX2 = 0;
    for (int i = 1; i <= nHorizontalSegments; i++) {
      final double x2 = i * lengthSegment / 1.0;
      path.conicTo(lastX2 + lengthSegment / 2, arcHeight, x2 / 1.0, 0, weight);
      lastX2 = x2;
    }

    int nVerticalSegments = (textHeight / lengthSegment).ceil();
    double lastY2 = 0;
    for (int i = 1; i <= nVerticalSegments; i++) {
      final double y2 = i * lengthSegment / 1.0;
      path.conicTo(lastX2 - arcHeight, lastY2 + lengthSegment / 2, lastX2, y2, weight);
      lastY2 = y2;
    }

    for (int i = nHorizontalSegments - 1; i >= 0; i--) {
      final double x2 = i * lengthSegment / 1.0;
      path.conicTo(lastX2 - lengthSegment / 2, lastY2 - arcHeight, x2 / 1.0, lastY2, weight);
      lastX2 = x2;
    }

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
