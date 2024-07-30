import 'package:example/screens/circle_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Text Draw Decorator Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () => context.push(CircleExampleScreen.route),
              child: const Text("Circled Text Examples"),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () => {},
              child: const Text("Underlined Text Examples"),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () => {},
              child: const Text("Boxed Text Examples"),
            ),
          ),
        ],
      ),
    );
  }
}
