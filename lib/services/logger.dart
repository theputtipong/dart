import 'package:logger/logger.dart';

loggerDebug(String value) async {
  var logger = Logger();
  logger.d(value);
}
