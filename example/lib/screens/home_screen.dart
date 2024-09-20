import 'package:example/screens/examples/box_example_screen.dart';
import 'package:example/screens/examples/circle_example_screen.dart';
import 'package:example/screens/examples/highlight_example_screen.dart';
import 'package:example/screens/examples/underline_example_screen.dart';
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
              onPressed: () => context.push(UnderlineExampleScreen.route),
              child: const Text("Underlined Text Examples"),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () => context.push(BoxExampleScreen.route),
              child: const Text("Boxed Text Examples"),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () => context.push(HighlightExampleScreen.route),
              child: const Text("Highlighted Text Examples"),
            ),
          ),
        ],
      ),
    );
  }
}
