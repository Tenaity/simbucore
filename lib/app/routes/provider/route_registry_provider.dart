// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/routes/service/route_registry.dart';

final routeRegistryProvider = Provider<RouteRegistry>(
  (ref) => RouteRegistry(),
);
