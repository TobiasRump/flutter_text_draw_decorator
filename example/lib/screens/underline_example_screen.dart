import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';

class UnderlineExampleScreen extends StatelessWidget {
  static const String route = '/underline-example';
  const UnderlineExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Underline Text Examples')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextDrawDecorator.underlined(
              text: const Text(
                'Underlined with Text',
                style: TextStyle(fontSize: 24),
              ),
              color: Colors.orange,
              strokeWidth: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Center(
              child: TextDrawDecorator.underlined(
                decoration: UnderlineDecorations.curved,
                text: const Text(
                  'Underlined',
                  style: TextStyle(fontSize: 32),
                ),
                color: Colors.red,
                strokeWidth: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
