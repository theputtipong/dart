import 'package:flutter/foundation.dart';

import '../models/login_model.dart';
import '../prefs/login_cache.dart';

class ValueLoginData with ChangeNotifier, DiagnosticableTreeMixin {
  LoginModel? loginData;

  LoginModel? get count => loginData;

  Future<void> setValue() async {
    var tempValue = await prefsGetLogin();
    if (tempValue != null) {
      loginData = loginModelFromJson(tempValue);
    } else {
      loginData = null;
    }
    notifyListeners();
  }

  checkValue() async => await prefsCheckLogin().then((value) {
        return value;
      });
}
