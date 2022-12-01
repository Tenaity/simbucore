import 'package:flutter/foundation.dart';
import 'package:gherkin/gherkin.dart';
import 'package:simbucore/app/core/service/global_environment_values.dart';

class Hooks extends Hook {
  /// The priority to assign to this hook.
  /// Higher priority gets run first so a priority of 10 is run before a priority of 2
  @override
  int get priority => 1;

  @override
  Future<void> onAfterScenarioWorldCreated(
      World world, String scenario, Iterable<Tag> tags) {
    // Reset the target platform value everytime we restart the app to test a scenario or feature
    // If we do not reset then the flutter test framework debugAssertAllFoundationVarsUnset fails.
    debugDefaultTargetPlatformOverride = null;
    setEnvironment(tags);
    return super.onAfterScenarioWorldCreated(world, scenario, tags);
  }

  void setEnvironment(Iterable<Tag> tags) {
    var environmentTags = tags
        .where((element) => element.name.toLowerCase().contains("environment"));
    
    if (environmentTags.length == 0){
      // No environment tags found 
      return;
    }

    var environmentName = environmentTags
        .first
        .name
        .toLowerCase()
        .replaceAll("environment", "");

    var configValues =
        '{ "api_endpoint_url": "https://stubbed", "environment": "$environmentName" }';
    GlobalEnvironmentValues.instance.loadValues(configValues);
  }
}
