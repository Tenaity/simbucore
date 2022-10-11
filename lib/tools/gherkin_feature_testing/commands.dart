const String flutterCmd = "flutter";
const String openAppCmd = "open";
const String nodeCmd = "node";
const String deleteCmd = "rm";
const String echoCmd = "echo";
const String createFileCmd = "touch";

List<String> buildRunner = ["pub", "run", "build_runner"];
List<String> clean = [...buildRunner, "clean"];
List<String> build = [...buildRunner, "build", "--delete-conflicting-outputs"];

List<String> openSimulator(String simulatorUuid) {
  return ["-a", "Simulator", "--args", "-CurrentDeviceUDID", simulatorUuid];
}

//flutter drive --driver=test_driver/integration_test_feature_driver.dart --target=integration_test/gherkin_suite_test.dart
List<String> runTheFeatureTests = [
  "drive",
  "--driver=test_driver/feature_driver.dart",
  "--target=integration_test/gherkin_suite_test.dart"
];
