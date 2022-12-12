// Singleton that contains all the environment values loaded from app_config.json when the application starts

import 'package:simbucore/app/core/model/environment_values.dart';
import 'package:simbucore/app/core/model/environments.dart';
import 'package:simbucore/app/core/service/env_config_reader.dart';

class GlobalEnvironmentValues{
  

  GlobalEnvironmentValues._();
  static final instance = GlobalEnvironmentValues._();

  late EnvironmentValues _values;
  
  String get apiEndpoint => _values.apiEndpoint;
  Environments get environment => _values.environment;
  String get authEndpoint => _values.authEndpoint;
  List<String> get authScopes => _values.authScopes;
  String get tokenEndpoint => _values.tokenEndpoint;
  String get applicationClientId => _values.clientId;

  void loadValues(String jsonEnvironmentValues){
    var reader = EnvConfigReader(jsonEnvironmentValues);
    var apiEndpoint = reader.value("api_endpoint_url");
    var environment = _getEnvironment(reader.value("environment"));
    var authEndpoint = reader.value("auth_endpoint");
    var tokenEndpoint = reader.value("token_endpoint");
    var scopes = _getScopes(reader.value("auth_scopes"));
    var clientId = reader.value("application_client_id");
    _values = EnvironmentValues(apiEndpoint, environment, authEndpoint, tokenEndpoint, scopes, clientId);
  }
  
  Environments _getEnvironment(String value) {
    if (value.toLowerCase() == "live"){
      return Environments.live;
    }
    if (value.toLowerCase() == "automated test"){
      return Environments.automatedTest;
    }
    if (value.toLowerCase() == "uat"){
      return Environments.uat;
    }
    return Environments.development;
  }

  List<String> _getScopes(String scopes){
    if (scopes == "" || scopes.trim().isEmpty){
      return <String>[];
    }
    var result = scopes.split(',').where((element) => element.trim().isNotEmpty).toList();
    return result;
  }
}