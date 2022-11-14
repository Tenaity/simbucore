/*
   Tests that we can read environment values like API endpoints from a config file.
*/

import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/core/service/env_config_reader.dart';

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
  group(
      'Environment Config JSON Reader Service:  ',
      () {
    readAPIEnpoint();
  });
}

String configFileJson() {
  return '''
{
    "api_endpoint_url": "https://simbudev"
}
  ''';
}

Future<void> readAPIEnpoint() async {
  return test('Read the API endpoint.', () {
    
    var reader = EnvConfigReader(configFileJson());
    var apiEndpoint = reader.value("api_endpoint_url");

    expect(apiEndpoint, "https://simbudev");
  });
}
