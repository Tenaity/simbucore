import 'package:flutter/foundation.dart';
import 'package:gherkin/gherkin.dart';

class Hooks extends Hook {
  /// The priority to assign to this hook.
  /// Higher priority gets run first so a priority of 10 is run before a priority of 2
  @override
  int get priority => 1;
  
  @override
  Future<void> onAfterScenarioWorldCreated(World world, String scenario, Iterable<Tag> tags) {
    // Reset the target platform value everytime we restart the app to test a scenario or feature
    // If we do not reset then the flutter test framework debugAssertAllFoundationVarsUnset fails.
    debugDefaultTargetPlatformOverride = null;
    return super.onAfterScenarioWorldCreated(world, scenario, tags);
  }
}