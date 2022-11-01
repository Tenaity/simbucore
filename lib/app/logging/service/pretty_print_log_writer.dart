import 'package:intl/intl.dart';
import 'package:simbucore/app/logging/service/log_writer.dart';
import 'package:logger/logger.dart';

// Prints pretty colourful log statements to the console
class PrettyPrintLogWriter implements LogWriter {
  late Logger logger;

  PrettyPrintLogWriter() {
    logger = Logger(
      printer: PrettyPrinter(
        noBoxingByDefault: true,
        methodCount: 0,
        colors: false,
      ),
    );
  }

  @override
  void debug(message) {
    logger.d(prefixDateTime(message));
  }

  @override
  void error(message, {StackTrace? stackTrace}) {
    logger.e(prefixDateTime(message), stackTrace);
  }

  @override
  void fatal(message, {StackTrace? stackTrace}) {
    logger.wtf(prefixDateTime(message), stackTrace);
  }

  @override
  void info(message) {
    logger.i(prefixDateTime(message));
  }

  @override
  void warn(message) {
    logger.w(prefixDateTime(message));
  }

  dynamic prefixDateTime(dynamic message){
    if (message is! String){
      return message;
    }

    var dtPrefix = '${DateFormat("yyyyMMdd H:m:ss").format(DateTime.now())} : ';

    return dtPrefix + message;
  }
}
