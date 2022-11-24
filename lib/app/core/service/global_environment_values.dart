// Singleton that contains all the environment values loaded from app_config.json when the application starts

import 'package:simbucore/app/core/model/environment_values.dart';
import 'package:simbucore/app/core/model/environments.dart';
import 'package:simbucore/app/core/service/env_config_reader.dart';

class GlobalEnvironmentValues{
  GlobalEnvironmentValues._();
  static final instance = GlobalEnvironmentValues._();

  late EnvironmentValues _values;
  
  get apiEndpoint => _values.apiEndpoint;
  get environment => _values.environment;

  void loadValues(String jsonEnvironmentValues){
    var reader = EnvConfigReader(jsonEnvironmentValues);
    var apiEndpoint = reader.value("api_endpoint_url");
    var environment = _getEnvironment(reader.value("environment"));
    _values = EnvironmentValues(apiEndpoint, environment);
  }
  
  Environments _getEnvironment(String value) {
    return Environments.development;
  }


}