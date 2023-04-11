/*
   Test that the environment values can be loaded from the inject app_config.json file.
*/

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simbucore/app/core/model/environments.dart';
import 'package:simbucore/app/core/model/platform_type.dart';
import 'package:simbucore/app/core/service/global_environment_values.dart';
import 'package:simbucore/app/logging/service/pretty_print_log_writer.dart';

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
    mapsAuthEndpoint();
    mapsAuthScope();
    mapsMultipleScopes();
    mapsEmptyStringToEmptyListOfScopes();
    mapsSpacesToEmptyListOfScopes();
    ignoresEmptyStringScopes();
    ignoresScopesThatJustContainSpaces();
    mapsClientId();
    setLogWriter();
    setPlatform();
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

Future<void> mapsAuthEndpoint() async {
  return test('Maps the Authority endpoint.', () {
    var values = ConfigValueBuilder(authEndpoint: ConfigValueBuilder.authEndpointUri).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.authority, ConfigValueBuilder.authEndpointUri);
  });
}

Future<void> mapsAuthScope() async {
  return test('Maps the authorisation Scopes.', () {
    var values = ConfigValueBuilder(authScope: ConfigValueBuilder.recipeManagementScope).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.scopes.first, ConfigValueBuilder.recipeManagementScope);
  });
}

Future<void> mapsMultipleScopes() async {
  return test('Maps multiple Auth scopes.', () {
    var scope1 = ConfigValueBuilder.recipeManagementScope;
    var scope2 = ConfigValueBuilder.recipeAdminScope;
    var values = ConfigValueBuilder(authScope: "$scope1,$scope2").build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.scopes.length, 2);
  });
}

Future<void> mapsEmptyStringToEmptyListOfScopes() async {
  return test('Maps to an empty list when no scopes passed in.', () {
    var values = ConfigValueBuilder(authScope: "").build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.scopes.length, 0);
  });
}

Future<void> mapsSpacesToEmptyListOfScopes() async {
  return test('Maps to an empty list when scope is just spaces.', () {
    var values = ConfigValueBuilder(authScope: "   ").build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.scopes.length, 0);
  });
}

Future<void> ignoresEmptyStringScopes() async {
  return test('Does not map scopes that are empty strings.', () {
    var scope1 = ConfigValueBuilder.recipeManagementScope;
    var scope2 = ConfigValueBuilder.recipeAdminScope;
    var values = ConfigValueBuilder(authScope: "$scope1,,$scope2").build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.scopes.length, 2);
  });
}

Future<void> ignoresScopesThatJustContainSpaces() async {
  return test('Does not map scopes that are just spaces.', () {
    var scope1 = ConfigValueBuilder.recipeManagementScope;
    var scope2 = ConfigValueBuilder.recipeAdminScope;
    var values = ConfigValueBuilder(authScope: "    ,$scope1,$scope2").build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.scopes.length, 2);
  });
}

Future<void> mapsClientId() async {
  return test('Maps the client id.', () {
    var values = ConfigValueBuilder(clientId: ConfigValueBuilder.applicationClientId).build();
    loadConfigValues(configValues: values);
    expect(GlobalEnvironmentValues.instance.applicationClientId, ConfigValueBuilder.applicationClientId);
  });
}

Future<void> setLogWriter() async {
  return test('Can set the log writer.', () {
    var values = ConfigValueBuilder(clientId: ConfigValueBuilder.applicationClientId).build();
    loadConfigValues(configValues: values);
    var logWriter = PrettyPrintLogWriter();
    GlobalEnvironmentValues.instance.setLogWriter(logWriter);
    expect(GlobalEnvironmentValues.instance.logWriter, logWriter);
  });
}


Future<void> setPlatform() async {
  return test('Can set the platform e.g. iOS.', () {
    var values = ConfigValueBuilder(clientId: ConfigValueBuilder.applicationClientId).build();
    loadConfigValues(configValues: values);
    
    GlobalEnvironmentValues.instance.setPlatform(PlatformType.iOS);
    expect(GlobalEnvironmentValues.instance.platform, PlatformType.iOS);
  });
}