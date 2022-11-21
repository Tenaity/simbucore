import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:simbucore/app/routes/model/a_route.dart';

class RoutesToGoRouterAdapter {
  final List<ARoute> routeModels;
  final String initialLocation;
  FutureOr<String?>? Function(dynamic context, dynamic state)? _redirect;
  List<NavigatorObserver>? _navigationObservers;
  bool hasRedirectionPolicy = false;

  RoutesToGoRouterAdapter(
    this.routeModels,
    this.initialLocation, {
    FutureOr<String?> Function(dynamic context, dynamic state)? redirect,
    List<NavigatorObserver>? navaigationObservers,
  }) {
    assert(routeModels.any((element) => element.path == initialLocation));
    _redirect = redirect;
    _navigationObservers = navaigationObservers;
    hasRedirectionPolicy = redirect != null;
  }

  GoRouter get goRouter => GoRouter(
        routes: routeModels
            .map((route) => GoRoute(
                path: route.path,
                builder: (context, state) => route.destination))
            .toList(),
        initialLocation: initialLocation,
        redirect: _redirect,
        observers: _navigationObservers,
      );
}
