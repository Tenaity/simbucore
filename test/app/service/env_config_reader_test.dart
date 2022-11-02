/*
   Tests that we can read environment values like API endpoints from a config file.
*/

import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/service/env_config_reader.dart';

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
      'Environment Config Reader Service:  ',
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
  return test('Knows the API endpoint.', () {
    var reader = EnvConfigReader(configFileJson());
    var apiEndpoint = reader.value("api_endpoint_url");

    expect(apiEndpoint, "https://simbudev");
  });
}
