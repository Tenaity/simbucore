import 'package:simbucore/app/event_action/service/action_registrar.dart';
import 'package:simbucore/app/event_store/service/i_message_bus_service.dart';
import 'package:simbucore/app/event_store/extension/counter_functions.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

class TestEventBusService implements IMessageBusService {
  late Map<String, int> eventCounter = {};
  Navigated? _lastNavigationEvent;
  final ActionRegistrar actionRegistrar;

  TestEventBusService(this.actionRegistrar);

  @override
  void fire(event) {
    addOrIncrementValue(eventCounter, event.runtimeType.toString());
    
    if (event is Navigated) {
      _lastNavigationEvent = event;
    }

    // Run actions that match the event type. 
    var eventAction = actionRegistrar.findByEventType(event.runtimeType.toString());
    if (eventAction != null){
      eventAction();
    }
  }

  @override
  void setCounter(Map<String, int> eventCounter) {
    this.eventCounter = eventCounter;
  }

  @override
  Navigated? lastNavigationEvent() {
    return _lastNavigationEvent;
  }
}
