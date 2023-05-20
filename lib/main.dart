import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';
import 'configs/timezone.dart';
import 'providers/login_provider.dart';
import 'routers/routers.dart';

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  setTimeZone();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerPages,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: MultiProvider(providers: [
          Provider<ValueLoginData>(create: (_) => ValueLoginData()),
        ], child: child!),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        primaryColor: Colors.white,
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(iconColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (states) => const BorderSide(color: Colors.white),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.black),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              );
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (states) => const TextStyle(color: Colors.black),
            ),
          ),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
