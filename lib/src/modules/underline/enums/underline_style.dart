import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/underline/painter/horizontal_underline_painter.dart';
import 'package:flutter_text_draw_decorator/src/modules/underline/painter/curved_underline_painter.dart';

enum UnderlineStyle {
  horizontal,
  curved;

  CustomPainter getPainter(Text text, Color color, double strokeWidth) {
    switch (this) {
      case UnderlineStyle.horizontal:
        return HorizontalUnderlinePainter(color: color, strokeWidth: strokeWidth);
      case UnderlineStyle.curved:
        return CurvedUnderlinePainter(textStyle: text.style ?? const TextStyle(), color: color, text: text.data ?? '', strokeWidth: strokeWidth);
    }
  }
}
