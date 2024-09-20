import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';

class BoxExampleScreen extends StatelessWidget {
  static const String route = '/box-example';
  const BoxExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Box Text Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextDrawDecorator.boxed(
              text: const Text(
                'Bubble Text',
                style: TextStyle(fontSize: 32),
              ),
              strokeWidth: 2,
            ),
            const SizedBox(height: 32),
            TextDrawDecorator.boxed(
              decoration: BoxDecorations.bubble,
              text: const Text(
                'Bubble Text 2',
                style: TextStyle(fontSize: 32),
              ),
              strokeWidth: 2,
              borderRadius: 16,
            ),
            const SizedBox(height: 32),
            TextDrawDecorator.boxed(
              decoration: BoxDecorations.bubble,
              text: const Text(
                'Bubble Text 2',
                style: TextStyle(fontSize: 32),
              ),
              strokeWidth: 2,
              borderRadius: 16,
            ),
            const SizedBox(height: 32),
            TextDrawDecorator.boxed(
              decoration: BoxDecorations.wavy,
              text: const Text(
                'Wavy Text 1',
                style: TextStyle(fontSize: 32),
              ),
              strokeWidth: 2,
              borderRadius: 16,
            ),
          ],
        ),
      ),
    );
  }
}
