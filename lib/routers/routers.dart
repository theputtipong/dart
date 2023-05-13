import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/homes/home.dart';
import '../pages/login/login.dart';

final GoRouter routerPages = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'homepage',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
    ),
  ],
);
