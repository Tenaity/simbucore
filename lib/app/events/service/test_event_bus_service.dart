import 'package:simbucore/app/events/service/i_message_bus_service.dart';
import 'package:simbucore/app/events/extension/counter_functions.dart';

class TestEventBusService implements IMessageBusService{
  late Map<String, int> eventCounter = {};
  @override
  void fire(event) {
    addOrIncrementValue(eventCounter, event.runtimeType.toString());
  }

  @override
  void setCounter(Map<String, int> eventCounter) {
    this.eventCounter = eventCounter;
  }
}