import 'package:flutter/material.dart';

abstract class DecorationBase {
  final Color color;
  final double strokeWidth;

  const DecorationBase({required this.color, required this.strokeWidth});
}
