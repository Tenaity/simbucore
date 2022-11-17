import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/routes/model/a_route.dart';
import 'package:simbucore/app/routes/service/route_registry.dart';

import 'fixture/stub_widget.dart';

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

const String routeName = "Login";
const String routeTitle = "Login Screen";
const String routePath = "/login";

void main() {
  group('Route Registry: ', () {
    canAdd();
    canAddMoreThanOne();
    canFindARouteByPath();
    canListRoutes();
    replaceRoute();
    hasAName();
    hasATitle();
    hasAPath();
    hasADestinationWidget();
  });
}

ARoute get aRoute => ARoute(routeName, routeTitle, routePath, const StubWidget());

Future<void> canAdd() async {
  return test('Can register a route', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    expect(registry.routes.length, 1);
  });
}

Future<void> canAddMoreThanOne() async {
  return test('Can register multiple routes', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    registry.add(ARoute("Splash", "Splash Screen", "/splash", const StubWidget()));
    expect(registry.routes.length, 2);
  });
}



Future<void> canFindARouteByPath() async {
  return test('Can find a route using the unique route path e.g. /login', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    registry.add(ARoute("Splash", "Splash Screen", "/splash", const StubWidget()));
    expect(registry.routeList.length, 2);
  });
}

Future<void> canListRoutes() async {
  return test('Can list all the registered routes', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    
    expect(registry.routes[routePath] != null, true);
  });
}

Future<void> replaceRoute() async {
  return test(
      'When you add a route with the same path, it replaces the existing route.',
      () {
    var registry = RouteRegistry();
    var newTitle = "Login Console";
    registry.add(aRoute);
    registry.add(ARoute(routeName, newTitle, routePath, const StubWidget()));

    var loginPathCount = registry.routeList.where((route) => route.path == routePath,).length;
    var loginRouteTitle = registry.routes[routePath]?.title;

    expect(loginPathCount == 1 && loginRouteTitle == newTitle, true);
  });
}

Future<void> hasAName() async {
  return test('A route has a name e.g. Login', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    expect(registry.routes[routePath]?.name, routeName);
  });
}

Future<void> hasATitle() async {
  return test('A route has a title e.g. Login Screen', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    expect(registry.routes[routePath]?.title, routeTitle);
  });
}

Future<void> hasAPath() async {
  return test('A route has a path e.g. /login', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    expect(registry.routes[routePath]?.path, routePath);
  });
}

Future<void> hasADestinationWidget() async {
  return test('A route has a destination widget e.g. Login()', () {
    var registry = RouteRegistry();
    registry.add(aRoute);
    expect(registry.routes[routePath]?.destination.toString(), const StubWidget().toString());
  });
}
