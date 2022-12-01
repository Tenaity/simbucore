/*
  Flutter Gherkin extension to allow tests to navigate to routes
*/

import 'package:flutter/widgets.dart';
import "package:flutter_gherkin/flutter_gherkin.dart";
import "package:flutter_test/flutter_test.dart";
import 'package:simbucore/app/routes/extension/go_router.dart';

extension RouterExtension on AppDriverAdapter<dynamic, dynamic, dynamic> {
  // Navigate to a route, pushes the route onto the navigation stack, remember to follow with await context.world.appDriver.waitForAppToSettle();
  void pushRoute<T>(String routeName) {
    var st = nativeDriver.state;
    var dm = st(find.byType(T));
    var buildContext = dm.context as BuildContext;
    buildContext.navPush(routeName);
  }
}
