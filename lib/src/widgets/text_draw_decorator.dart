import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';
import 'package:flutter_text_draw_decorator/src/painter/box/box_painter.dart';
import 'package:flutter_text_draw_decorator/src/painter/box/wavy_box_painter.dart';
import 'package:flutter_text_draw_decorator/src/painter/highlight/highlight_painter.dart';
import 'package:flutter_text_draw_decorator/src/painter/underline/underline_painter.dart';

// TODO: Cleanup optionals, maybe use classes instead of enum?
class CircleDecoration extends DecorationBase {
  const CircleDecoration({required super.color, required super.strokeWidth});

  factory CircleDecoration.standard() {
    return const CircleDecoration(color: Colors.orange, strokeWidth: 1);
  }
}

enum CircleStyle {
  openCircled,
  closedCircled;
  //...

  CustomPainter getPainter(Text text, {CircleDecoration decoration = const CircleDecoration(color: Colors.orange, strokeWidth: 1)}) {
    switch (this) {
      case CircleStyle.openCircled:
        return OpenCirclePainter(text: text.data ?? '', textStyle: text.style ?? const TextStyle(), decoration: decoration);
      case CircleStyle.closedCircled:
        return ClosedCirclePainter(text: text.data ?? '', textStyle: text.style ?? const TextStyle(), decoration: decoration);
      //...
    }
  }
}

enum UnderlineStyle {
  horizontal,
  curved;
  //...

  CustomPainter getPainter(Text text, Color color, double strokeWidth) {
    switch (this) {
      case UnderlineStyle.horizontal:
        return HorizontalUnderlinePainter(color: color, strokeWidth: strokeWidth);
      case UnderlineStyle.curved:
        return CurvedUnderlinePainter(textStyle: text.style ?? const TextStyle(), color: color, text: text.data ?? '', strokeWidth: strokeWidth);
      //...
    }
  }
}

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

enum HighlightStyle {
  textmarker;

  CustomPainter getPainter(Text text, Color? color, double? strokeWidth) {
    switch (this) {
      case HighlightStyle.textmarker:
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

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: text,
    );
  }
}
