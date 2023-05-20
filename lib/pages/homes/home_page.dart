import 'package:dart/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../prefs/login_cache.dart';
import '../../services/logger.dart';
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
    super.initState();
    prepareVariable().whenComplete(() => setState(() {}));
  }

  Future prepareVariable() async {
    widget.loginData != null
        ? loginData = widget.loginData
        : await prefsGetLogin().then((value) {
            loggerDebug('prefsGetLogin $value');
            if (value != null) loginData = loginModelFromJson(value);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetsAppbar(
        context,
        null,
        actions: [
          loginData != null
              ? TextButton.icon(
                  onPressed: () async {
                    // context.goNamed('profile');
                    await prefsClearLogin().then((value) {
                      context.pushNamed('/');
                    });
                  },
                  icon: const Icon(Icons.person_rounded),
                  label: Text('User ${loginData?.user}'.toUpperCase()))
              : IconButton(onPressed: () => context.goNamed('login'), icon: const Icon(Icons.login_rounded))
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
