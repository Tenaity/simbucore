// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/model/application_mode.dart';

// Determines if the application is running or being used for other purposes like testing.
final applicationModeProvider = StateProvider<ApplicationMode>(
  (ref) => ApplicationMode.running,
);
