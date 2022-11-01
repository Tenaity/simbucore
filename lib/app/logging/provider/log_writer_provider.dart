import 'package:simbucore/app/logging/service/log_writer.dart';
import 'package:simbucore/app/logging/service/pretty_print_log_writer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final logWriterProvider = Provider<LogWriter>(
  (ref) => PrettyPrintLogWriter(),
);