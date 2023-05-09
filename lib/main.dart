import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'page/homepage.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(title: 'Flutter Web Demo Homepage'),
    );
  }
}
