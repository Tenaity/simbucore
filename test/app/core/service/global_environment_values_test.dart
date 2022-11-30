/*
   Test that the environment values can be loaded from the inject app_config.json file.
*/

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/core/model/environments.dart';
import 'package:simbucore/app/core/service/global_environment_values.dart';

import 'fixture/config_value_builder.dart';

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

String _configValuesFromFile = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _configValuesFromFile = await rootBundle.loadString("app_config.json");
  group(
      'Load environment values from app_config.json file:  ',
      () {
    readAPIEnpointFromFile();
    mapsAPIEnpoint();
    mapsTheEnvironment();
    mapToAutomatedTestEnvironment();
    mapToUatEnvironment();
    mapToLiveEnvironment();
  });
}

void loadConfigValues ({String? configValues}){
  GlobalEnvironmentValues.instance.loadValues(configValues ?? ConfigValueBuilder().build());
}

Future<void> readAPIEnpointFromFile() async {
  return test('Can load the API endpoint from the project app.config.json file.', () {
    loadConfigValues(configValues:  _configValuesFromFile);
    expect(GlobalEnvironmentValues.instance.apiEndpoint, "https://simbudev");
  });
}

Future<void> mapsAPIEnpoint() async {
  return test('Maps the API endpoint.', () {
    var apiEndpoint = "https://mypoint";
    var values = ConfigValueBuilder(apiEndpoint: apiEndpoint).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.apiEndpoint, apiEndpoint);
  });
}

Future<void> mapsTheEnvironment() async {
  return test('Maps the environment.', () {
    var environment = "develpment";
    var values = ConfigValueBuilder(environment: environment).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.environment, Environments.development);
  });
}

Future<void> mapToAutomatedTestEnvironment() async {
  return test('Can set the environment to automated testing.', () {
    var environment = "automated test";
    var values = ConfigValueBuilder(environment: environment).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.environment, Environments.automatedTest);
  });
}

Future<void> mapToUatEnvironment() async {
  return test('Can set the environment to uat.', () {
    var environment = "uat";
    var values = ConfigValueBuilder(environment: environment).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.environment, Environments.uat);
  });
}

Future<void> mapToLiveEnvironment() async {
  return test('Can set the environment to live.', () {
    var environment = "live";
    var values = ConfigValueBuilder(environment: environment).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.environment, Environments.live);
  });
}