import 'package:event_bus/event_bus.dart';
import 'package:simbucore/app/event_action/service/action_registrar.dart';
import 'package:simbucore/app/event_store/extension/counter_functions.dart';
import 'package:simbucore/app/event_store/service/i_message_bus_service.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

class EventBusService implements IMessageBusService {
  final EventBus bus;
  final ActionRegistrar actionRegistrar;
  Navigated? _lastNavigationEvent;

  EventBusService(this.bus, this.actionRegistrar);

  @override
  void fire(event) {
    bus.fire(event);
  }

  @override
  void setCounter(Map<String, int> eventCounter) {
    bus.on().listen((event) {
      addOrIncrementValue(eventCounter, event.runtimeType.toString());
      
      if (event is Navigated) {
        _lastNavigationEvent = event;
      }

      // Run actions that match the event type. 
      var eventAction = actionRegistrar.findByEventType((event).toString());
      if (eventAction != null){
        eventAction();
      }
    });
  }

  @override
  Navigated? lastNavigationEvent() {
    return _lastNavigationEvent;
  }
}
