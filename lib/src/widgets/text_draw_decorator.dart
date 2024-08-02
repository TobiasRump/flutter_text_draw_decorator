import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';
import 'package:flutter_text_draw_decorator/src/painter/underline/underline_painter.dart';

enum CircleDecorations {
  openCircled,
  closedCircled;
  //...

  CustomPainter getPainter(Text text, Color color, double strokeWidth) {
    switch (this) {
      case CircleDecorations.openCircled:
        return OpenCirclePainter(textStyle: text.style ?? const TextStyle(), color: color, text: text.data ?? '', strokeWidth: strokeWidth);
      case CircleDecorations.closedCircled:
        return ClosedCirclePainter(textStyle: text.style ?? const TextStyle(), color: color, text: text.data ?? '', strokeWidth: strokeWidth);
      //...
    }
  }
}

enum UnderlineDecorations {
  horizontal,
  curved;
  //...

  CustomPainter getPainter(Text text, Color color, double strokeWidth) {
    switch (this) {
      case UnderlineDecorations.horizontal:
        return HorizontalUnderlinePainter(color: color, strokeWidth: strokeWidth);
      case UnderlineDecorations.curved:
        return CurvedUnderlinePainter(textStyle: text.style ?? const TextStyle(), color: color, text: text.data ?? '', strokeWidth: strokeWidth);
      //...
    }
  }
}

class TextDrawDecorator extends StatelessWidget {
  final Text text;
  final CustomPainter painter;

  const TextDrawDecorator({
    required this.text,
    required this.painter,
    super.key,
  });

  factory TextDrawDecorator.circled(
      {required Text text, CircleDecorations decoration = CircleDecorations.closedCircled, Color color = Colors.black, double strokeWidth = 1}) {
    return TextDrawDecorator(
      text: text,
      painter: decoration.getPainter(text, color, strokeWidth),
    );
  }

  factory TextDrawDecorator.underlined(
      {required Text text, UnderlineDecorations decoration = UnderlineDecorations.horizontal, Color color = Colors.black, double strokeWidth = 1}) {
    return TextDrawDecorator(
      text: text,
      painter: decoration.getPainter(text, color, strokeWidth),
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
