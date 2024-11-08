import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HighlightPainter extends CustomPainter {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final double? strokeWidth;

  HighlightPainter({required this.text, required this.color, required this.textStyle, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? textPainter.height;

    const yThreshold = 5;
    final horizontalOffset = textPainter.width / 4;
    final Path path = Path()
      ..moveTo(0, textPainter.height / 2)
      ..cubicTo(
        horizontalOffset,
        size.height / 2 + yThreshold,
        size.width - horizontalOffset,
        size.height / 2 - yThreshold,
        size.width,
        size.height / 2 + yThreshold,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
