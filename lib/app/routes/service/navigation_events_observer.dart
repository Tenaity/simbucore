import 'package:flutter/widgets.dart';
import 'package:simbucore/app/event_store/service/event_store.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

class NavigationEventsObserver extends NavigatorObserver {
  final EventStore eventStore;
  NavigationEventsObserver(this.eventStore);
  

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    raiseNavigatedEvent(route.settings.name ?? "");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    raiseNavigatedEvent(route.settings.name ?? "");
  }

  @override
  void didReplace({ Route<dynamic>? newRoute, Route<dynamic>? oldRoute }) {
    raiseNavigatedEvent(newRoute?.settings.name ?? "");
  }
  
  void raiseNavigatedEvent(String routeName) {
    eventStore.bus.fire(Navigated(routeName));
  }
}