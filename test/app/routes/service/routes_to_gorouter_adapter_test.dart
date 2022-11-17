import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/routes/model/a_route.dart';
import 'package:simbucore/app/routes/service/routes_to_gorouter_adapter.dart';

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

List<ARoute> routeModels() {
  return <ARoute>[
    ARoute("Login", "Login Screen", "/login", const StubWidget()),
    ARoute("Splash", "Splash Screen", "/splash", const StubWidget()),
  ];
}

const String initialLocation = "/splash";

void main() {
  group('Routes to GoRouter Adapter: ', () {
    buildsGoRouterFromRoutes();
    convertsRoutesToGoRouterRoutes();
    setsAnInitialLocation();
    theIntialLocationMustExistInTheRoutes();
  });
}

Future<void> buildsGoRouterFromRoutes() async {
  return test('Generates the GoRouter from a list of route models', () {
    var goRouter =
        RoutesToGoRouterAdapter(routeModels(), initialLocation).goRouter;
    expect(goRouter.runtimeType.toString(), "GoRouter");
  });
}

Future<void> convertsRoutesToGoRouterRoutes() async {
  return test('Converts each route to a GoRouter route', () {
    var routes = routeModels();
    var goRouter = RoutesToGoRouterAdapter(routes, initialLocation).goRouter;

    expect(goRouter.routeConfiguration.routes.length, routes.length);
  });
}

Future<void> setsAnInitialLocation() async {
  return test('Sets the intial location e.g. /home', () {
    var goRouter =
        RoutesToGoRouterAdapter(routeModels(), initialLocation).goRouter;
    expect(goRouter.routeInformationProvider.value.location, initialLocation);
  });
}

Future<void> theIntialLocationMustExistInTheRoutes() async {
  return test('The initial location must exist in the list of routes', () {
    expect(() => RoutesToGoRouterAdapter(routeModels(), "/notinroutes"),
        throwsAssertionError);
  });
}
