// Obtain shared preferences.
import 'package:dart/models/login_model.dart';
import 'package:dart/services/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getPrefs() async {
  return await SharedPreferences.getInstance();
}

Future<void> cacheLoginData(LoginModel value) async {
  String loginData = loginModelToJson(value);
  loggerDebug('saveLoginData $loginData');
  await getPrefs().then((value) => value.setString('logindata_cachev1', loginData));
}

Future<String?> readLoginData() async {
  return await getPrefs().then((value) => value.getString('logindata_cachev1'));
}

Future<bool> checkLoginData() async {
  return await getPrefs().then((value) => value.containsKey('logindata_cachev1'));
}

Future<bool> clearLoginData() async {
  bool status = await getPrefs().then((value) => value.remove('logindata_cachev1').then((value) async {
        bool checkKey = await checkLoginData();
        loggerDebug('clearLoginData containsKey $checkKey');
        return value;
      }));
  return status;
}
