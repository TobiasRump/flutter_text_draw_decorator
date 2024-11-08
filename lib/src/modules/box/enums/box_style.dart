import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/box/decorations/bubble_box_tip.dart';
import 'package:flutter_text_draw_decorator/src/modules/box/painter/rounded_box_painter.dart';
import 'package:flutter_text_draw_decorator/src/modules/box/painter/wavy_box_painter.dart';

enum BoxStyle {
  rounded,
  bubble,
  wavy;

  CustomPainter getPainter(Text text, double borderRadius, double strokeWidth) {
    switch (this) {
      case BoxStyle.rounded:
        return RoundedBoxPainter(text: text, borderRadius: borderRadius, strokeWidth: strokeWidth);
      case BoxStyle.bubble:
        return BubbleBoxPainter(
          text: text,
          padding: 4,
          bubbleColor: Colors.orange,
          tip: const BubbleBoxTip(
            position: TipPosition.left,
            orientation: TipOrientation.left,
          ),
        );
      case BoxStyle.wavy:
        return WavyBoxPainter(text: text, borderColor: Colors.black);
    }
  }
}
