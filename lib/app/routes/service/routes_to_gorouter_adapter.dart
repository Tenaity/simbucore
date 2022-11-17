import 'package:go_router/go_router.dart';
import 'package:simbucore/app/routes/model/a_route.dart';

class RoutesToGoRouterAdapter {
  final List<ARoute> routeModels;
  RoutesToGoRouterAdapter(this.routeModels);

  GoRouter get goRouter => GoRouter(
      routes: routeModels
          .map((route) => GoRoute(
              path: route.path, builder: (context, state) => route.destination))
          .toList());
}
