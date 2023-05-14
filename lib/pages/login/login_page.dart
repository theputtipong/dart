import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginModel login;
  late FocusNode _user, _pass;

  @override
  void initState() {
    super.initState();
    login = LoginModel();
    _user = FocusNode();
    _pass = FocusNode();
  }

  @override
  void dispose() {
    _user.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                focusNode: _user,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_rounded),
                  filled: false,
                  border: OutlineInputBorder(),
                ),
                restorationId: 'user_field',
                onSaved: (value) {
                  login.user = value;
                  _pass.requestFocus();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: _pass,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_rounded),
                  filled: false,
                  border: OutlineInputBorder(),
                ),
                restorationId: 'pass_field',
                onFieldSubmitted: (value) {
                  setState(() {
                    login.pass = value;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_rounded,
                      size: 30,
                    ),
                    color: Colors.blueAccent,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_rounded,
                      size: 30,
                    ),
                    color: Colors.blueAccent,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_rounded,
                      size: 30,
                    ),
                    color: Colors.blueAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
