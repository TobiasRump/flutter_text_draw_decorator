import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/base/text_decoration_painter.dart';
import 'package:flutter_text_draw_decorator/src/modules/circle/mixins/circle_mixin.dart';

class OpenCirclePainter extends TextDecoratorPainter with CircleConstraints {
  OpenCirclePainter({
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
    final scaledVerticalRadiusTopCircle = circleSize.verticalRadius * 3.5;
    const verticalOffset = 1.8;
    const startAngleBottomCircle = -1.5;
    const sweepAngleBottomCircle = pi + 1.5;
    const startAngleTopCircle = pi + 6.2;
    const sweepAngleTopCircle = pi - 1;

    final centerOffset = Offset(
      size.width / 2,
      (size.height / verticalOffset) + verticalOffset,
    );

    canvas
      ..drawArc(
        Rect.fromCenter(
          center: centerOffset,
          width: scaledHorizontalRadius,
          height: scaledVerticalRadiusBottomCircle,
        ),
        startAngleBottomCircle,
        sweepAngleBottomCircle,
        false,
        paint,
      )
      ..drawArc(
        Rect.fromCenter(
          center: centerOffset,
          width: scaledHorizontalRadius,
          height: scaledVerticalRadiusTopCircle,
        ),
        startAngleTopCircle,
        sweepAngleTopCircle,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
