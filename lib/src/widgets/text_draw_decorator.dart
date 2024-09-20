import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';
import 'package:flutter_text_draw_decorator/src/painter/box/box_painter.dart';
import 'package:flutter_text_draw_decorator/src/painter/box/wavy_box_painter.dart';
import 'package:flutter_text_draw_decorator/src/painter/highlight/highlight_painter.dart';
import 'package:flutter_text_draw_decorator/src/painter/underline/underline_painter.dart';

// TODO: Cleanup optionals, maybe use classes instead of enum?

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

enum BoxDecorations {
  rounded,
  bubble,
  wavy;

  CustomPainter getPainter(Text text, double borderRadius, double strokeWidth) {
    switch (this) {
      case BoxDecorations.rounded:
        return RoundedBoxPainter(text: text, borderRadius: borderRadius, strokeWidth: strokeWidth);
      case BoxDecorations.bubble:
        return BubbleBoxPainter(
          text: text,
          padding: 4,
          bubbleColor: Colors.orange,
          tip: const BubbleBoxTip(
            position: TipPosition.left,
            orientation: TipOrientation.left,
          ),
        );
      case BoxDecorations.wavy:
        return WavyBoxPainter(text: text, borderColor: Colors.black);
    }
  }
}

enum HighlightDecorations {
  textmarker;

  CustomPainter getPainter(Text text, Color? color, double? strokeWidth) {
    switch (this) {
      case HighlightDecorations.textmarker:
        return HighlightPainter(
          text: text.data ?? '',
          color: color ?? Colors.yellow,
          textStyle: text.style ?? const TextStyle(),
          strokeWidth: strokeWidth,
        );
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

  factory TextDrawDecorator.circled({
    required Text text,
    CircleDecorations decoration = CircleDecorations.closedCircled,
    Color color = Colors.black,
    double strokeWidth = 1,
  }) {
    return TextDrawDecorator(
      text: text,
      painter: decoration.getPainter(text, color, strokeWidth),
    );
  }

  factory TextDrawDecorator.underlined({
    required Text text,
    UnderlineDecorations decoration = UnderlineDecorations.horizontal,
    Color color = Colors.black,
    double strokeWidth = 1,
  }) {
    return TextDrawDecorator(
      text: text,
      painter: decoration.getPainter(text, color, strokeWidth),
    );
  }

  factory TextDrawDecorator.boxed({
    required Text text,
    BoxDecorations decoration = BoxDecorations.bubble,
    double borderRadius = 1,
    double strokeWidth = 1,
  }) {
    return TextDrawDecorator(
      text: text,
      painter: decoration.getPainter(text, borderRadius, strokeWidth),
    );
  }

  factory TextDrawDecorator.highlighted({
    required Text text,
    Color? color,
    double? strokeWidth,
    HighlightDecorations decoration = HighlightDecorations.textmarker,
  }) {
    return TextDrawDecorator(text: text, painter: decoration.getPainter(text, color, strokeWidth));
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: text,
    );
  }
}
