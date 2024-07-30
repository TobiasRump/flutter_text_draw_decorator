import 'package:example/screens/circle_example_screen.dart';
import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter get routes => GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: CircleExampleScreen.route,
            builder: (BuildContext context, GoRouterState state) {
              return const CircleExampleScreen();
            },
          ),
        ],
      );
}
