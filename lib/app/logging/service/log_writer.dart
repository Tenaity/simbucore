// Log service that can write to a log
abstract class LogWriter{
  // Development.
  void debug(dynamic message);

  // Key events.
  void info(dynamic message);

  // Warnings.
  void warn(dynamic message);

  // Error info.
  void error(dynamic message, {StackTrace? stackTrace});

  // WTF! Game over.
  void fatal(dynamic message, {StackTrace? stackTrace});
}