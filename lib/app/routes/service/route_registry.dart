import 'package:simbucore/app/routes/model/a_route.dart';

class RouteRegistry {
  final Map<String,ARoute> _routes = <String, ARoute>{};

  Map<String,ARoute> get routes => _routes;
  List<ARoute> get routeList => _routes.values.toList();

  void add(ARoute route) {
    _routes[route.path] = route;
  }
}