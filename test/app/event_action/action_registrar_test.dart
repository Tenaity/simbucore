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
        myTest();
    });
}

Future<void> myTest() async {
   return test('Can register a function to run for a specific event e.g. RouteToLogin() for NotAuthenticated', () {
      var eventType = 'NotAuthenticated';
      var registrar = ActionRegistrar();
      var expectedValue = "my value";
      registrar.register(eventType, () => expectedValue);
      var action = registrar.findByEventType(eventType);
      expect(action(), expectedValue);
   });
}