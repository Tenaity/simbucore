import 'package:go_router/go_router.dart';

/// Register application routes, used to configure GoRouter
class GoRouteRegistrar {
  final List<GoRoute> _registeredRoutes = [];

  List<GoRoute> get routes => _registeredRoutes;

  void add(GoRoute newRoute) {
    _registeredRoutes.removeWhere((route) => route.path == newRoute.path);
    _registeredRoutes.add(newRoute);
  }

  void addMany(List<GoRoute> newRoutes) {
    for (var route in newRoutes) {
      add(route);
    }
  }
}
