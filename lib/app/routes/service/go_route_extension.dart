import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension GoRouteExtension on BuildContext {
  void navPush(String routeName){
    GoRouter.of(this).push(routeName);
  }

  void navGo(String routeName){
    GoRouter.of(this).go(routeName);
  }

  void navPop(){
    GoRouter.of(this).pop();
  }
}

