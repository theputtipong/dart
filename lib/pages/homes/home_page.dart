import 'package:dart/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/appbar.dart';

class HomePage extends StatefulWidget {
  final LoginModel? loginData;
  const HomePage({this.loginData, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginModel? loginData;

  @override
  void initState() {
    loginData = widget.loginData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetsAppbar(
        context,
        null,
        actions: [
          IconButton(onPressed: () => context.goNamed('login'), icon: const Icon(Icons.login_rounded)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginData != null ? Text('This Home page user ${loginData?.user}') : const Text('This Home page'),
          ],
        ),
      ),
    );
  }
}
