import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:simbucore/app/core/model/environments.dart';
import 'package:simbucore/app/core/service/global_environment_values.dart';
import 'package:simbucore/integration_test/gherkin/builder/hook_buillder.dart';

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
    group('Environment Tags: ', () {
        defaultNotSet();
        canSetLiveEnvironment();
        canSetUatEnvironment();
        setsFirstEnvTag();
    });
}

Future<void> defaultNotSet() async {
   return test('Not set when no environment tags found', () {
      var tags = <Tag>{};
      Hooks().setEnvironment(tags);
      expect(GlobalEnvironmentValues.instance.initialised, false);
   });
}

Future<void> canSetLiveEnvironment() async {
   return test('Set to live when @LiveEnvironment tag is fouond', () {
      var tags = <Tag>{Tag("LiveEnvironment", 1)};
      Hooks().setEnvironment(tags);
      expect(GlobalEnvironmentValues.instance.environment == Environments.live, true);
   });
}

Future<void> canSetUatEnvironment() async {
   return test('Set to uat when @UatEnvironment tag is fouond', () {
      var tags = <Tag>{Tag("UatEnvironment", 1)};
      Hooks().setEnvironment(tags);
      expect(GlobalEnvironmentValues.instance.environment == Environments.uat, true);
   });
}

Future<void> setsFirstEnvTag() async {
   return test('Sets environment based on the first environment tag when more than one found', () {
      var tags = <Tag>{Tag("LiveEnvironment", 1), Tag("UatEnvironment", 2)};
      Hooks().setEnvironment(tags);
      expect(GlobalEnvironmentValues.instance.environment == Environments.live, true);
   });
}

