import 'package:event_bus/event_bus.dart';
import 'package:simbucore/app/events/extension/counter_functions.dart';
import 'package:simbucore/app/events/service/i_message_bus_service.dart';

class EventBusService implements IMessageBusService{
  final EventBus bus;

  EventBusService(this.bus);

  @override
  void fire(event) {
    bus.fire(event);
  }
  
  @override
  void setCounter(Map<String, int> eventCounter) {
    bus.on().listen((event) {
      addOrIncrementValue(eventCounter, event.runtimeType.toString());
    });
  }
  

}