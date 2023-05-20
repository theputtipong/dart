// Obtain shared preferences.
import 'package:dart/models/login_model.dart';
import 'package:dart/services/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/login_provider.dart';

Future<SharedPreferences> getPrefs() async {
  return await SharedPreferences.getInstance();
}

Future<void> prefsSetLogin(LoginModel value) async {
  String loginData = loginModelToJson(value);
  loggerDebug('prefsSetLogin $loginData');
  await getPrefs().then((value) => value.setString('login_cachev1', loginData));
}

Future<String?> prefsGetLogin() async {
  return await getPrefs().then((value) => value.getString('login_cachev1'));
}

Future<bool> prefsCheckLogin() async {
  return await getPrefs().then((value) => value.containsKey('login_cachev1'));
}

Future<bool> prefsClearLogin() async {
  bool status = await getPrefs().then((value) => value.remove('login_cachev1').then((value) async {
        bool checkKey = await prefsCheckLogin();
        loggerDebug('prefsCheckLogin containsKey $checkKey');
        return value;
      }));
  return status;
}
