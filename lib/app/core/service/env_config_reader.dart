import 'dart:convert';

// Access to enviromental values that are loaded from a config file.
// The CI/CD injects the per environment files on deployment.
class EnvConfigReader {
  late Map<String, dynamic> _config;

  EnvConfigReader(String configFileJson) {
    _config = json.decode(configFileJson) as Map<String, dynamic>;
  }

  String value(String key) {
    return _config.containsKey(key) ? _config[key] : "";
  }
}
