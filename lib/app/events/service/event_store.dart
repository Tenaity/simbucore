// Project imports:
import 'package:simbucore/app/events/service/i_message_bus_service.dart';

// Collates events by listening to the application message bus.
class   EventStore{
  final IMessageBusService bus;
  final Map<String, int> eventCounter = {};

  EventStore(this.bus){
    bus.setCounter(eventCounter);
  }
}