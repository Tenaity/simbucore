// Dart imports:
import 'dart:io';

//Future<File> fileFixture(String name) async => File(Directory.current.path + '/test/fixture/$name');
//final jsonReport = jsonDecode(await file.readAsString());


String fileFixture(String name) {
   var dir = Directory.current.path;
   if (dir.endsWith('/test')) {
     dir = dir.replaceAll('/test', '');
   }
   
   var filePath = '$dir/test/integration_test/report/fixture/$name';
   return File(filePath).readAsStringSync();
}
