// Package imports:
import 'package:event_bus/event_bus.dart';

// Project imports:
import 'package:simbucore/app/events/extension/counter_functions.dart';

// Stores events raised by the application
class EventStore{
  late EventBus bus;
  late Map<String, int> eventCounter = {};
  
  EventStore(EventBus eventBus){
    bus = eventBus;
    bus.on().listen((event) {
      eventCounter = addOrIncrementValue(eventCounter, event.runtimeType.toString());
    });
  }
}
