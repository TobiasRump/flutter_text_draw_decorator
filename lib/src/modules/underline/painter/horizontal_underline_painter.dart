import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/underline/base/underline_painter.dart';

class HorizontalUnderlinePainter extends UnderlinePainter {
  HorizontalUnderlinePainter({required super.color, required super.strokeWidth, super.horizontalOffset});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final Path path = Path()
      ..moveTo(horizontalOffset.left, size.height)
      ..lineTo(size.width - horizontalOffset.right, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
