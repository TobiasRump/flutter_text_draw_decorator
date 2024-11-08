import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/src/modules/box/enums/box_style.dart';
import 'package:flutter_text_draw_decorator/src/modules/circle/enums/circle_style.dart';
import 'package:flutter_text_draw_decorator/src/modules/highlight/enums/highlight_style.dart';
import 'package:flutter_text_draw_decorator/src/modules/underline/enums/underline_style.dart';
import 'package:flutter_text_draw_decorator/src/modules/circle/decorations/circle_decoration.dart';

class TextDrawDecorator extends StatelessWidget {
  final Text text;
  final CustomPainter painter;

  const TextDrawDecorator({
    required this.text,
    required this.painter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: text,
    );
  }

  factory TextDrawDecorator.circled({
    required Text text,
    CircleStyle style = CircleStyle.closedCircled,
    CircleDecoration? decoration,
  }) {
    return TextDrawDecorator(
      text: text,
      painter: style.getPainter(text, decoration: CircleDecoration.standard()),
    );
  }

  factory TextDrawDecorator.underlined({
    required Text text,
    UnderlineStyle style = UnderlineStyle.horizontal,
    Color color = Colors.black,
    double strokeWidth = 1,
  }) {
    return TextDrawDecorator(
      text: text,
      painter: style.getPainter(text, color, strokeWidth),
    );
  }

  factory TextDrawDecorator.boxed({
    required Text text,
    BoxStyle style = BoxStyle.bubble,
    double borderRadius = 1,
    double strokeWidth = 1,
  }) {
    return TextDrawDecorator(
      text: text,
      painter: style.getPainter(text, borderRadius, strokeWidth),
    );
  }

  factory TextDrawDecorator.highlighted({
    required Text text,
    HighlightStyle style = HighlightStyle.textmarker,
    Color? color,
    double? strokeWidth,
  }) {
    return TextDrawDecorator(text: text, painter: style.getPainter(text, color, strokeWidth));
  }
}
