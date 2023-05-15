import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/login_model.dart';
import '../../styles/assets.dart';

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
                  prefixIcon: Icon(
                    Icons.person_rounded,
                    color: Colors.grey,
                  ),
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'username',
                  hintStyle: TextStyle(color: Colors.grey),
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
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    color: Colors.grey,
                  ),
                  filled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'password',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                restorationId: 'pass_field',
                onFieldSubmitted: (value) {
                  setState(() {
                    login.pass = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const SizedBox(
                  width: 100,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Login',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(facebookIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(tiktokIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(twitterIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(lineIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(googleIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(microsoftIcon),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(linkedinIcon),
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
