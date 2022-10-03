import 'dart:io';

Future<void> runCommand(String command, List<String> args) async {
  var result = await Process.run(command, args);
  stdout.write(result.stdout);
}