import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';

class CircleExampleScreen extends StatelessWidget {
  static const String route = '/circle-example';
  const CircleExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circle Text Examples')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextDrawDecorator.circled(
              text: const Text(
                'Circled with Text',
                style: TextStyle(fontSize: 24),
              ),
              color: Colors.orange,
              strokeWidth: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Center(
              child: TextDrawDecorator.circled(
                text: const Text(
                  'Circled',
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
