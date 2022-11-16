// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/routes/service/go_route_registrar.dart';

final goRouteRegistrarProvider = Provider<GoRouteRegistrar>(
  (ref) => GoRouteRegistrar(),
);
