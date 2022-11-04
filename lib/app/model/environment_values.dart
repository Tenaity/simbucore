// Environment values loaded from the app_config.json files when the application starts
// The CI/CD overrides the file as part of the build to inject the secret env values.
class EnvironmentValues{
  final String apiEndpoint;

  EnvironmentValues(this.apiEndpoint);
}