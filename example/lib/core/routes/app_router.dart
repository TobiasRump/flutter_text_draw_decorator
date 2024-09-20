import 'package:example/screens/examples/box_example_screen.dart';
import 'package:example/screens/examples/circle_example_screen.dart';
import 'package:example/screens/examples/highlight_example_screen.dart';
import 'package:example/screens/home_screen.dart';
import 'package:example/screens/examples/underline_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              return CircleExampleScreen(key: UniqueKey());
            },
          ),
          GoRoute(
            path: UnderlineExampleScreen.route,
            builder: (BuildContext context, GoRouterState state) {
              return UnderlineExampleScreen(key: UniqueKey());
            },
          ),
          GoRoute(
            path: BoxExampleScreen.route,
            builder: (BuildContext context, GoRouterState state) {
              return BoxExampleScreen(key: UniqueKey());
            },
          ),
          GoRoute(
            path: HighlightExampleScreen.route,
            builder: (BuildContext context, GoRouterState state) {
              return HighlightExampleScreen(key: UniqueKey());
            },
          )
        ],
      );
}
