import 'package:event_bus/event_bus.dart';
import 'package:simbucore/app/event_store/extension/counter_functions.dart';
import 'package:simbucore/app/event_store/service/i_message_bus_service.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

class EventBusService implements IMessageBusService {
  final EventBus bus;
  Navigated? _lastNavigationEvent;

  EventBusService(this.bus);

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
    });
  }

  @override
  Navigated? lastNavigationEvent() {
    return _lastNavigationEvent;
  }
}
