import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/base/decoration_base.dart';

class CircleDecoration extends DecorationBase {
  const CircleDecoration({required super.color, required super.strokeWidth});

  factory CircleDecoration.standard() {
    return const CircleDecoration(color: Colors.orange, strokeWidth: 1);
  }
}
