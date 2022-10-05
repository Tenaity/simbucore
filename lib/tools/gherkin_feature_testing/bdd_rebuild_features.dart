/*
  Usage: dart run tools/dt/bin/dt.dart -c /Users/simbu/Mobile/flutter/d
*/

import 'dart:io';

import 'command_runner.dart';
import 'commands.dart';

Future<void> rebuildTheBDDFeatureScaffold(String path) async {
  stdout.writeln("Regenerating BDD Features...");
  Directory.current = path;
  await runCommand(flutterCmd, clean);
  await runCommand(flutterCmd, build);
}
