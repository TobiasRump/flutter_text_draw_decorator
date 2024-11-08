import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/base/decoration_base.dart';

abstract class TextDecoratorPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final DecorationBase decoration;

  TextDecoratorPainter({super.repaint, required this.text, required this.textStyle, required this.decoration});
}
