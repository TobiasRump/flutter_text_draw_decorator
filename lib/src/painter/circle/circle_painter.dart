import 'dart:math';

import 'package:flutter/material.dart';
import 'circle_base.dart';

abstract class CirclePainter extends CustomPainter with CircleBase {
  final Color color;
  final TextStyle textStyle;
  final double strokeWidth;
  CirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.textStyle,
  });
}

class ClosedCirclePainter extends CirclePainter {
  final String text;

  ClosedCirclePainter({
    required this.text,
    required super.textStyle,
    required super.color,
    super.strokeWidth = 1,
  }) : assert(text != '' && strokeWidth > 0);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
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

class OpenCirclePainter extends CustomPainter with CircleBase {
  final Color color;
  final String text;
  final TextStyle textStyle;
  final double strokeWidth;

  OpenCirclePainter({
    required this.color,
    required this.text,
    required this.textStyle,
    this.strokeWidth = 1,
  }) : assert(text != '' && strokeWidth > 0);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
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
