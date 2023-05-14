import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/homes/home_page.dart';
import '../pages/login/login_page.dart';

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context, required GoRouterState state, required Widget child, required String type}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}

final GoRouter routerPages = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
      pageBuilder: (context, state) => RouterTransitionFactory.getTransitionPage(
        context: context,
        state: state,
        child: const HomePage(),
        type: 'fade',
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) => const LoginPage(),
          pageBuilder: (context, state) => RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: const LoginPage(),
            type: 'fade',
          ),
        ),
      ],
    ),
  ],
);
