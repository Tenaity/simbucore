// Environment values loaded from the app_config.json files when the application starts
// The CI/CD overrides the file as part of the build to inject the secret env values.
import 'package:simbucore/app/core/model/environments.dart';

class EnvironmentValues{
  final String apiEndpoint;
  final Environments environment;

  EnvironmentValues(this.apiEndpoint, this.environment);
}