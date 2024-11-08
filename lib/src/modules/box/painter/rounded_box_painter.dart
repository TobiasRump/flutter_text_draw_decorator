import 'dart:math';
import 'package:flutter/material.dart';

class RoundedBoxPainter extends CustomPainter {
  final Text text;
  final double borderRadius;
  final double strokeWidth;

  RoundedBoxPainter({
    super.repaint,
    required this.text,
    required this.borderRadius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // TODO: Extract and make generic
    final textSpan = TextSpan(text: text.data, style: text.style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    final boxWidth = min(textWidth, size.width);

    final textHeight = textPainter.height;
    double boxHeight = textHeight;

    final heightFactor = (textWidth / size.width);
    final nLines = heightFactor.ceil();
    boxHeight = nLines * textHeight;

    final centerOffset = Offset(
      size.width / 2,
      (size.height / 2),
    );

    final rrect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: centerOffset, width: boxWidth, height: boxHeight),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
