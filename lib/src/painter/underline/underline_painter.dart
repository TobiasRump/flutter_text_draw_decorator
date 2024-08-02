import 'package:flutter/material.dart';

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

class HorizontalOffset {
  final double left;
  final double right;
  const HorizontalOffset(this.left, this.right);
}

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
