import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';

class TextDrawDecorator extends StatelessWidget {
  final Text text;
  final CustomPainter painter;

  const TextDrawDecorator({
    required this.text,
    required this.painter,
    super.key,
  });

  factory TextDrawDecorator.circled({required Text text, Color color = Colors.black, double strokeWidth = 1}) {
    return TextDrawDecorator(
      text: text,
      painter: OpenCirclePainter(textStyle: text.style ?? const TextStyle(), color: color, text: text.data ?? '', strokeWidth: strokeWidth),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: text,
    );
  }
}
