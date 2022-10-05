/*
  Usage: dart run tools/dt/bin/dt.dart -b /Users/simbu/Mobile/flutter/digestableme iPhone13Pro
*/
import 'dart:io';

import 'command_runner.dart';
import '../../../integration_test/gherkin/adapter/gherkin_cucumber_html.dart';
import 'commands.dart';

const String iPhone = "iPhone";
const String iPhone8 = "iPhone8";
const String iPhone13Pro = "iPhone13Pro";
const String pixel5 = "pixel5";

const String iPhone8UUID = "6FB30977-E11C-4001-A749-4403F4B3E261";
const String iPhone13ProUUID = "A49BC245-DB99-4E14-9870-131C8976CA2C";
const String iPhone14ProUUID = "0A2BDB91-D9C7-4897-94EA-C48A499CCE19";
const String pixel5EmulatorID = "emulator-5554";
final String gherkinReportPath = "${Directory.current.path}/integration_test/report/integration_response_data.json";

final deviceUuidMap = {
    iPhone13Pro: iPhone13ProUUID,
    iPhone8: iPhone8UUID,
    pixel5: pixel5EmulatorID,
};

Future<void> createAndViewTheCucumberReport(String path, String device) async {
  stdout.writeln("Cucumber Report");
  createCucumberJsReport(device);
  createReportMetaData(device);
  await viewCucumberJsReport(path);
}

Future<void> runTheFeatureTestsAndCreateTheCucumberReport(String path, String device) async {
  var deviceId = deviceUuidMap[device] ?? iPhone14ProUUID;
  stdout.writeln("BDD Report. Device: $device DevidId: $deviceId");
  if (device.contains(iPhone)) {
    await openiPhoneSimulator(deviceId, path);
  }
  await deleteExistingReport();
  await createDefaultGherkinReport();
  await runFeatureTests(deviceId);
  createCucumberJsReport(device);
  createReportMetaData(device);
  await viewCucumberJsReport(path);
}

Future<void> openiPhoneSimulator(String simulatorUuid, String path) async {
  Directory.current = path;
  stdout.writeln("   Opening iPhone simulator...");
  await runCommand(openAppCmd, openSimulator(simulatorUuid)).timeout(const Duration(seconds: 3));
}

Future<void> createDefaultGherkinReport() async {
  stdout.writeln("   Creating default report placeholder... ");
  runCommand(createFileCmd, [gherkinReportPath]);
}

Future<void> deleteExistingReport() async {
  stdout.writeln("   Deleting existing report... ");
  var reportPath = gherkinReportPath;
  await runCommand(deleteCmd, [reportPath]);
}

Future<void> runFeatureTests(String deviceId) async {
  stdout.writeln("   Running Application Feature Tests... DeviceId: $deviceId");
  stdout.writeln("      Cmd: flutter drive -driver=test_driver/integration_test_feature_driver.dart --target=integration_test/gherkin_suite_test.dart -d $deviceId");
  await runCommand(flutterCmd, [...runTheFeatureTests, "-d", deviceId]);
}

void createCucumberJsReport(String device) {
  stdout.writeln("   Creating Cucumberjs Report");
  var jsonReportPath = gherkinReportPath;
  var jsonReport = File(jsonReportPath).readAsStringSync();
  var formattedJson = formatJsonForCucumberHtmlReport(jsonReport);
  var formattedReportPath = "${Directory.current.path}/integration_test/gherkin/reporter/cucumber-html/digestableme.json";
  File(formattedReportPath).writeAsStringSync(formattedJson);
}

void createReportMetaData(String deviceName){
  // "Platform": "iOS 15.4",
  var metaJson = 
  '''
{
  "App Version":"0.1",
  "Test Environment": "Development",
  "Device": "deviceId",
  "Parallel": "Scenarios",
  "Executed": "Local"
}
  ''';
  metaJson = metaJson.replaceAll("deviceId", deviceName);
  var metaPath = "${Directory.current.path}/integration_test/gherkin/reporter/cucumber-html/meta.json";
  File(metaPath).writeAsStringSync(metaJson);
}

Future<void> viewCucumberJsReport(String path) async {
  stdout.writeln("   Opening Cucumberjs Report");
  Directory.current = "$path/integration_test/gherkin/reporter/cucumber-html";
  await runCommand(nodeCmd, ["index.js"]);
}