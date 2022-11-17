import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:simbucore/app/routes/model/a_route.dart';

class RoutesToGoRouterAdapter {
  final List<ARoute> routeModels;
  final String initialLocation;
  FutureOr<String?> Function(dynamic context, dynamic state)? _redirect;
  RoutesToGoRouterAdapter(this.routeModels, this.initialLocation,
      {FutureOr<String?> Function(dynamic context, dynamic state)? redirect}) {
    assert(routeModels.any((element) => element.path == initialLocation));
    _redirect = redirect;
  }

  GoRouter get goRouter => _redirect == null
      ? GoRouter(
          routes: routeModels
              .map((route) => GoRoute(
                  path: route.path,
                  builder: (context, state) => route.destination))
              .toList(),
          initialLocation: initialLocation,
        )
      : GoRouter(
          routes: routeModels
              .map((route) => GoRoute(
                  path: route.path,
                  builder: (context, state) => route.destination))
              .toList(),
          initialLocation: initialLocation,
          redirect: _redirect,
        );
}
