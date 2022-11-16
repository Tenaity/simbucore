import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/event_action/service/action_registrar.dart';

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
    group('Register event actions: ', () {
        canRegisterEventFunction();
        notFound();
    });
}

Future<void> canRegisterEventFunction() async {
   return test('Can register a function to run for a specific event e.g. RouteToLogin() for NotAuthenticated', () {
      var eventType = 'NotAuthenticated';
      var registrar = ActionRegistrar();
      var expectedValue = "my value";
      registrar.register(eventType, () => expectedValue);
      var action = registrar.findByEventType(eventType);
      expect(action!(), expectedValue);
   });
}

Future<void> notFound() async {
   return test('Returns null when there is no function registered for an event', () {
      
      var registrar = ActionRegistrar();
     
      var action = registrar.findByEventType("monkey");
      expect(action, null);
   });
}