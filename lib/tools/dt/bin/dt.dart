/*
 * Developer Command Line Tools
 * https://dart.dev/tutorials/server/cmdline
 * 
 * Commands:
 * 
 * Run feature tests and show cucumber report:
 *  dart run tools/dt/bin/dt.dart -b /Users/simbu/Mobile/flutter/digestableme B7A5F50E-DA94-49D0-913F-698AF846365D
 * Rebuild features
 *  dart run tools/dt/bin/dt.dart -c /Users/simbu/Mobile/flutter/digestableme
*/

import 'dart:io';
import 'package:args/args.dart';
import 'bdd_rebuild_features.dart';
import 'bdd_report.dart';

const runFeatureTests = 'runfeaturetests';
const viewcucumberreport = 'viewcucumberreport';
const refreshFeatures = 'refreshFeatures';

void main(List<String> arguments) {
  exitCode = 0; // presume success

  final parser = ArgParser()..addFlag(runFeatureTests, negatable: false, abbr: 'f');
  parser.addFlag(refreshFeatures, negatable: false, abbr: 'r');
  parser.addFlag(viewcucumberreport, negatable: false, abbr: 'c');

  ArgResults argResults = parser.parse(arguments);
  final args = argResults.rest;

  dt(args,
      runFeatureTests: argResults[runFeatureTests] as bool,
      refreshFeatures: argResults[refreshFeatures] as bool,
      viewCucumberReport: argResults[viewcucumberreport] as bool);
}

Future<void> dt(
  List<String> args, {
  bool runFeatureTests = false,
  bool refreshFeatures = false,
  bool viewCucumberReport = false,
}) async {
  try {
    var path = args[0];
    
    if (runFeatureTests) {
      var device = args[1];
      runTheFeatureTestsAndCreateTheCucumberReport(path, device);
    } else if (refreshFeatures) {
      rebuildTheBDDFeatureScaffold(path);
    } else if (viewCucumberReport) {
      var device = args[1];
      createAndViewTheCucumberReport(path, device);
    }
  } catch (_) {
    await _handleError(_.toString());
  }
}

Future<void> _handleError(String error) async {
  stderr.writeln('error: $error');
  exitCode = 2;
}
