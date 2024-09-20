import 'package:example/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlutterTextDrawDecoratorExample());

class FlutterTextDrawDecoratorExample extends StatelessWidget {
  const FlutterTextDrawDecoratorExample({super.key});

  static final router = AppRouter.routes;

  @override
  Widget build(BuildContext context) => MaterialApp.router(routerConfig: router);
}
