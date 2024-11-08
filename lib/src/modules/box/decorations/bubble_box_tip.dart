import 'package:flutter/material.dart';

enum TipPosition {
  left(0.3),
  right(0.9),
  center(0.6);

  const TipPosition(this.percentage);
  final double percentage;
}

enum TipOrientation {
  left,
  right;
}

class BubbleBoxTip {
  final TipPosition position;
  final TipOrientation orientation;

  const BubbleBoxTip({this.position = TipPosition.center, this.orientation = TipOrientation.right});
}

class BubbleBoxPainter extends CustomPainter {
  final Text text;
  final double padding; //! TODO: fix text not being centered
  final Color bubbleColor;
  final double borderRadius;
  final BubbleBoxTip tip;

  BubbleBoxPainter({
    super.repaint,
    required this.text,
    required this.padding,
    required this.bubbleColor,
    this.borderRadius = 8,
    this.tip = const BubbleBoxTip(),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = bubbleColor
      ..strokeWidth = 2 // TODO: add as param?
      ..style = PaintingStyle.stroke;

    // Calculate text size
    final textPainter = TextPainter(
      text: TextSpan(text: text.data, style: text.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    // Calculate bubble size
    final bubbleWidth = textWidth + padding * 2;
    final bubbleHeight = textHeight + padding * 2;

    // Calculate tail size
    //! TODO: extract
    final tailHeight = bubbleHeight * 0.25;

    final path = Path();

    // Top left corner
    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    // Top right corner
    path.lineTo(bubbleWidth - borderRadius, 0);
    path.quadraticBezierTo(bubbleWidth, 0, bubbleWidth, borderRadius);

    // Bottom right corner
    path.lineTo(bubbleWidth, bubbleHeight - borderRadius);
    path.quadraticBezierTo(bubbleWidth, bubbleHeight, bubbleWidth - borderRadius, bubbleHeight);

    double tipOffset = bubbleWidth * 0.05;

    double tipStart = bubbleWidth * tip.position.percentage;
    double tipBaseWidth = bubbleWidth * 0.2;
    double tipEnd = tipStart - tipBaseWidth;
    double tipPeak = tipEnd - tipOffset;
    if (tip.orientation == TipOrientation.right) {
      tipPeak = tipStart + tipOffset;
    }

    // Bottom left corner with tail
    path.lineTo(tipStart, bubbleHeight);
    path.lineTo(tipPeak, bubbleHeight + tailHeight);
    path.lineTo(tipEnd, bubbleHeight);
    path.lineTo(borderRadius, bubbleHeight);
    path.quadraticBezierTo(0, bubbleHeight, 0, bubbleHeight - borderRadius);

    path.close();

    // Draw the bubble
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
