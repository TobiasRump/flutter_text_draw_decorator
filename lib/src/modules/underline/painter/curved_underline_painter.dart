import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/underline/base/underline_painter.dart';

class CurvedUnderlinePainter extends UnderlinePainter {
  CurvedUnderlinePainter({required this.text, required super.color, required super.strokeWidth, super.textStyle});

  final String text;

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
      ..strokeWidth = strokeWidth;
    final Path path = Path()
      ..moveTo(5, size.height * 1.1)
      ..cubicTo(
        size.width - textPainter.width / 2,
        size.height + 1,
        size.width - textPainter.width / 4,
        size.height - 7,
        size.width,
        size.height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
