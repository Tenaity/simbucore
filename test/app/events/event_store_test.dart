import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/events/service/event_store.dart';
import 'package:simbucore/app/events/service/test_event_bus_service.dart';
import 'package:simbucore/app/routes/event/navigated.dart';

//
// #     #                   #######
// #     # #    # # #####       #    ######  ####  #####
// #     # ##   # #   #         #    #      #        #
// #     # # #  # #   #         #    #####   ####    #
// #     # #  # # #   #         #    #           #   #
// #     # #   ## #   #         #    #      #    #   #
//  #####  #    # #   #         #    ######  ####    #
//

// #######
//    #    ######  ####  #####
//    #    #      #        #
//    #    #####   ####    #
//    #    #           #   #
//    #    #      #    #   #
//    #    ######  ####    #

const navigatedEventName = 'Navigated';

void main() {
  group('Test event collation on the message bus: ', () {
    incrementsEventCounter();
    incrementsEventCounterForMultipleEvents();
    incrementsDifferentEventCounters();
    recordsTheLastNavigationEvent();
  });
}

Future<void> incrementsEventCounter() async {
  return test('Records an event occurance', () {
    var eventStore = EventStore(TestEventBusService());

    eventStore.bus.fire(Navigated(navigatedEventName));

    var navigatedEventCount = eventStore.eventCounter[navigatedEventName] ?? 0;
    expect(navigatedEventCount, 1);
  });
}

Future<void> incrementsEventCounterForMultipleEvents() async {
  return test('Records multiple event occurances', () {
    var eventStore = EventStore(TestEventBusService());

    eventStore.bus.fire(Navigated(navigatedEventName));
    eventStore.bus.fire(Navigated(navigatedEventName));

    var navigatedEventCount = eventStore.eventCounter[navigatedEventName] ?? 0;
    expect(navigatedEventCount, 2);
  });
}

Future<void> incrementsDifferentEventCounters() async {
  return test('Record counts for each event type', () {
    var eventStore = EventStore(TestEventBusService());

    eventStore.bus.fire(Navigated(navigatedEventName));
    eventStore.bus.fire("String event");

    var noOfCounts = eventStore.eventCounter.length;
    expect(noOfCounts, 2);
  });
}

Future<void> recordsTheLastNavigationEvent() async {
  return test('Records the last navigation event', () {
    var eventStore = EventStore(TestEventBusService());

    eventStore.bus.fire(Navigated(navigatedEventName));

    Navigated? lastNavigationEvent = eventStore.lastNavigationEvent;
    expect(lastNavigationEvent != null, true);
  });
}
