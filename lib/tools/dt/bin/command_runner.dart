import 'dart:io';

Future<void> runCommand(String command, List<String> args) async {
  var result = await Process.run(command, args);
  stdout.write(result.stdout);
}

//https://github.com/tekartik/process_run.dart/blob/master/doc/shell.md
// Future<void> runCommandInShell(String command, List<String> args) async {
//   var result = await Process.run(command, args);
//   stdout.write(result.stdout);
// }

// shell = shell.pushd('example');

// await shell.run('''

// # Listing directory in the example folder
// dir

// ''');
// shell = shell.popd();