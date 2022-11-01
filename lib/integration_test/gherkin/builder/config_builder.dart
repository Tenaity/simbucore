//https://giters.com/jonsamwell/flutter_gherkin/issues/193
//import 'package:flutter_gherkin/flutter_gherkin_integration_test.dart'; // notice new import name
// ignore_for_file: avoid_print
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:simbucore/integration_test/gherkin/builder/hook_buillder.dart';
import 'package:simbucore/integration_test/gherkin/builder/tag_builder.dart';

// World
import 'extended_world_builder.dart';

FlutterTestConfiguration gherkinTestConfiguration(Iterable<Pattern> features, Iterable<StepDefinitionGeneric<World>> stepDefinitions){
  var testConfiguration =  FlutterTestConfiguration(
    features: features,
    stepDefinitions: stepDefinitions,
    tagExpression: tagExpression,
    createWorld: (TestConfiguration config) => createExtendedWorld(config),
    reporters: [
      StdoutReporter(MessageLevel.error)
        ..setWriteLineFn(print)
        ..setWriteFn(print),
      ProgressReporter()
        ..setWriteLineFn(print)
        ..setWriteFn(print),
      TestRunSummaryReporter()
        ..setWriteLineFn(print)
        ..setWriteFn(print),
      JsonReporter(
        writeReport: (_, __) => Future<void>.value(),
      ),
    ],
    //waitImplicitlyAfterAction: true,
    hooks: [Hooks()],
  );
  return testConfiguration;
}

