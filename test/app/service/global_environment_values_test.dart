/*
   Test that the environment values can be loaded from the inject app_config.json file.
*/

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/core/service/global_environment_values.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalEnvironmentValues.instance.loadValues(await rootBundle.loadString("app_config.json"));
  group(
      'Load environment values from app_config.json file:  ',
      () {
    mapsAPIEnpoint();
  });
}

Future<void> mapsAPIEnpoint() async {
  return test('Maps the API endpoint using the EnvConfigReader.', () {
    expect(GlobalEnvironmentValues.instance.apiEndpoint, "https://simbudev");
  });
}