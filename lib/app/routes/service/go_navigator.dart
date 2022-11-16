import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// Enable navigation without the BuildContext using a global navigationKey.
class GoNavigator{
  static late BuildContext _buildContext;
  static bool _hasBuildContext = false;

  static BuildContext get buildContext {
    assert(!_hasBuildContext, "NoContextNavigator: BuildContext is not available to resolve providers, the root widget must initialise before we can use this service.");
    return _buildContext;
  }

  static set setBuildContext(BuildContext buildContext) => {_buildContext = buildContext, _hasBuildContext = true};

  void push(String routeName){
    GoRouter.of(_buildContext).push(routeName);
  }

  void go(String routeName){
    GoRouter.of(_buildContext).go(routeName);
  }

  void pop(){
    GoRouter.of(_buildContext).pop();
  }
}