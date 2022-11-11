// Project imports:
import 'package:simbucore/app/event_store/service/i_message_bus_service.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

// Collates events by listening to the application message bus.
class   EventStore{
  final IMessageBusService bus;
  final Map<String, int> eventCounter = {};

  EventStore(this.bus){
    bus.setCounter(eventCounter);
  }

  Navigated? get lastNavigationEvent => bus.lastNavigationEvent();
}