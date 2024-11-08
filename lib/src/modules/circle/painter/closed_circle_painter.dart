import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/base/text_decoration_painter.dart';
import 'package:flutter_text_draw_decorator/src/modules/circle/mixins/circle_mixin.dart';

class ClosedCirclePainter extends TextDecoratorPainter with CircleConstraints {
  ClosedCirclePainter({
    required super.text,
    required super.textStyle,
    required super.decoration,
  }) : assert(text != '' && decoration.strokeWidth > 0);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.strokeWidth
      ..style = PaintingStyle.stroke;

    final circleSize = getCircleSizes(text: text, textStyle: textStyle);

    final scaledHorizontalRadius = circleSize.horizontalRadius * 2.1;
    final scaledVerticalRadiusBottomCircle = circleSize.verticalRadius * 2.9;
    const verticalOffset = 1.8;

    final centerOffset = Offset(
      size.width / 2,
      (size.height / verticalOffset) + verticalOffset,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: centerOffset,
        width: scaledHorizontalRadius,
        height: scaledVerticalRadiusBottomCircle,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
