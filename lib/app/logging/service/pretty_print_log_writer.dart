
import 'package:simbucore/app/logging/service/log_writer.dart';
import 'package:logger/logger.dart';

// Prints pretty colourful log statements to the console
class PrettyPrintLogWriter implements LogWriter {
  late Logger logger;

  PrettyPrintLogWriter() {
    logger = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );
  }

  @override
  void debug(message) {
    logger.d(message);
  }

  @override
  void error(message, {StackTrace? stackTrace}) {
    logger.e(message, stackTrace);
  }

  @override
  void fatal(message, {StackTrace? stackTrace}) {
    logger.wtf(message, stackTrace);
  }

  @override
  void info(message) {
    logger.i(message);
  }

  @override
  void warn(message) {
    logger.w(message);
  }
}
