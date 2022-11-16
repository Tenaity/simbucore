import 'package:simbucore/app/event_store/service/i_message_bus_service.dart';
import 'package:simbucore/app/event_store/extension/counter_functions.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

class TestEventBusService implements IMessageBusService {
  late Map<String, int> eventCounter = {};
  Navigated? _lastNavigationEvent;

  @override
  void fire(event) {
    addOrIncrementValue(eventCounter, event.runtimeType.toString());

    if (event is Navigated) {
      _lastNavigationEvent = event;
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
