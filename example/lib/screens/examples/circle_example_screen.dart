import 'package:flutter/material.dart';
import 'package:flutter_text_draw_decorator/flutter_text_draw_decorator.dart';

class CircleExampleScreen extends StatelessWidget {
  static const String route = '/circle-example';
  const CircleExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circle Text Examples')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextDrawDecorator.circled(
                text: const Text(
                  'Closed Circle',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 32),
              TextDrawDecorator.circled(
                style: CircleStyle.openCircled,
                text: const Text(
                  'Open Circled',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 32),
              TextDrawDecorator.circled(
                style: CircleStyle.openCircled,
                text: const Text(
                  'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
