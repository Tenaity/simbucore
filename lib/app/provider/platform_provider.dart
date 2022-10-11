// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';

// Project imports:
import 'package:simbucore/app/service/platform_adapter.dart';

// Determines if the application is running or being used for other purposes like testing.
final platformProvider = Provider<UniversalPlatformType>(
  (ref) => PlatformAdapter().getPlatformType(),
);
