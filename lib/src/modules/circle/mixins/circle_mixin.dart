import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/circle/classes/circle_size.dart';

mixin CircleConstraints {
  getCircleSizes({
    required String text,
    required TextStyle textStyle,
  }) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    const textHeightOffset = 2;
    const textWidthScale = 1.8;
    const textHeightScale = 2;
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;
    final horizontalRadius = (textPainter.width) / textWidthScale;
    final verticalRadius = (textPainter.height) / textHeightScale - textHeightOffset;

    return CircleSize(
      textWidth: textWidth,
      textHeight: textHeight,
      horizontalRadius: horizontalRadius,
      verticalRadius: verticalRadius,
    );
  }
}
