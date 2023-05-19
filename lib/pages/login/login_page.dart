import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../cache/login_cache.dart';
import '../../models/login_model.dart';
import '../../styles/assets.dart';
import '../../widgets/appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginModel loginData;
  late FocusNode _user, _pass;

  @override
  void initState() {
    super.initState();
    prepareVariable().whenComplete(() => setState(() {}));
  }

  Future prepareVariable() async {
    loginData = LoginModel();
    _user = FocusNode();
    _pass = FocusNode();
    _user.requestFocus();
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
      appBar: widgetsAppbar(context, loginData),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            focusNode: _user,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_rounded,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              filled: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: 'username',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            restorationId: 'user_field',
                            onChanged: (value) {
                              loginData.user = value;
                            },
                            onFieldSubmitted: (value) => _pass.requestFocus(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            focusNode: _pass,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_rounded,
                                color: Colors.grey,
                              ),
                              filled: false,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: 'password',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            restorationId: 'pass_field',
                            onChanged: (value) {
                              loginData.pass = value;
                            },
                            onFieldSubmitted: (value) => loginEvent(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 75,
                    child: ElevatedButton(
                      onPressed: () => loginEvent(context),
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
                  ),
                ],
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
      persistentFooterButtons: const [
        SizedBox(
          height: 50,
          child: Center(
            child: Text('Copyright © 2022 Pdouvch'),
          ),
        )
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }

  Future<void> loginEvent(BuildContext context) async =>
      await cacheLoginData(loginData).then((value) => context.pushNamed('/', extra: loginData));
}
