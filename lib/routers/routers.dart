import 'package:dart/models/login_model.dart';
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
      name: '/',
      builder: (BuildContext context, GoRouterState state) {
        LoginModel loginData = state.extra as LoginModel;
        return HomePage(loginData: loginData);
      },
      pageBuilder: (context, state) {
        LoginModel loginData = state.extra as LoginModel;
        return RouterTransitionFactory.getTransitionPage(
          context: context,
          state: state,
          child: HomePage(loginData: loginData),
          type: 'fade',
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          name: 'login',
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
