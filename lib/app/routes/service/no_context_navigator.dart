import 'package:flutter/widgets.dart';

// Enable navigation without the BuildContext using a global navigationKey.
class NoContextNavigator{
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> push(String routeName){
    return navigationKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> go(String routeName){
    return navigationKey.currentState!.pushReplacementNamed(routeName);
  }

  pop(){
    return navigationKey.currentState!.pop();
  }
}