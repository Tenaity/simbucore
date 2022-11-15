import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:simbucore/app/routes/service/go_route_registrar.dart';

//
// #     #                   #######
// #     # #    # # #####       #    ######  ####  #####
// #     # ##   # #   #         #    #      #        #
// #     # # #  # #   #         #    #####   ####    #
// #     # #  # # #   #         #    #           #   #
// #     # #   ## #   #         #    #      #    #   #
//  #####  #    # #   #         #    ######  ####    #
//

// #######
//    #    ######  ####  #####
//    #    #      #        #
//    #    #####   ####    #
//    #    #           #   #
//    #    #      #    #   #
//    #    ######  ####    #

void main() {
  group('Go Route Registrar: ', () {
    registerRoute();
    replaceRoute();
  });
}

GoRoute newRoute({String? routeName}) {
  return GoRoute(
    path: "login",
    name: routeName ?? "login",
    builder: (BuildContext context, GoRouterState state) {
      return Container();
    },
  );
}

Future<void> registerRoute() async {
  return test('Can register a route', () {
    var routePath = "login";
    var registrar = GoRouteRegistrar();

    registrar.add(newRoute());

    expect(registrar.routes.any((route) => route.name == routePath), true);
  });
}



Future<void> replaceRoute() async {
  return test(
      'When you add a route with the same path, it replaces the existing route.',
      () {
    var routeNewRouteName = "diffname";
    var registrar = GoRouteRegistrar();

    registrar.add(newRoute());
    registrar.add(newRoute(routeName: routeNewRouteName));

    expect(registrar.routes.length == 1 && registrar.routes.any((route) => route.name == routeNewRouteName), true);
  });
}
