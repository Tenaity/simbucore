import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/data_access/event/not_authenticated.dart';
import 'package:simbucore/app/event_action/service/action_registrar.dart';
import 'package:simbucore/app/event_store/service/event_store.dart';
import 'package:simbucore/app/event_store/service/test_event_bus_service.dart';
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

void main() {
    group('Action Registrar is used by the Event Store: ', () {
        actionRegisterUsed();
    });
}

// Runs an action that matches th

Future<void> actionRegisterUsed() async {
   return test('Runs a registered action that matches on eventtype e.g. NotAuthenticated matches to action to route to login screen.', () {
    
    //   Sequence:
    //    App starts
    //    NotAuthenticated event is raised
    //    Action Registrar match and route to login called
    //    Navigated event raised
    
    var actionRegister = ActionRegistrar();
    var bus = TestEventBusService(actionRegister);
    actionRegister.register("NotAuthenticated", () => bus.fire(Navigated("/Login")));
    var eventStore = EventStore(bus);

    eventStore.bus.fire(NotAuthenticated());

    var navigatedEventCount = eventStore.eventCounter["Navigated"] ?? 0;
    expect(navigatedEventCount, 1);

   });
}