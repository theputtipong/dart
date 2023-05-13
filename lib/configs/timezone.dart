import 'package:dart/services/logger.dart';
import 'package:timezone/browser.dart' as tz;

Future<void> setTimeZone() async {
  await tz.initializeTimeZone();
  var bangkok = tz.getLocation('Asia/Bangkok');
  var now = tz.TZDateTime.now(bangkok);
  loggerDebug('setTimeZone $now');
}
