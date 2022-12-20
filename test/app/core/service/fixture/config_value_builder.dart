class ConfigValueBuilder {
  static const fileStart = "{";
  static const fileEnd = "}";
  static const yourAzureADTenantID = "123abc45d-6e7f-8g9h-ij10-kl1mn23456o7";
  static const yourScopeID = "111aaa22b-3c4d-5e6f-ff78-gg9hh00000i1";
  static const apiEndpointUri = "https://simbudev";
  static const authEndpointUri = "https://login.microsoftonline.com/$yourAzureADTenantID";
  static const recipeManagementScope = "api://$yourScopeID/Recipe.Management";
  static const recipeAdminScope = "api://$yourScopeID/Recipe.Admin";
  static const applicationClientId = "11bbb11c-1d1d-1f1h-jk11-sb1ef11111c1";

  final String apiEndpoint;
  final String environment;
  final String authScope;
  final String authEndpoint;
  final String clientId;

  ConfigValueBuilder({
    this.apiEndpoint = apiEndpointUri,
    this.environment = "development", 
    this.authEndpoint = authEndpointUri,
    this.authScope = "$recipeManagementScope;$recipeAdminScope",
    this.clientId = applicationClientId
  });

  String build() {
    var configValueBuffer = StringBuffer();
    configValueBuffer.write(fileStart);
    configValueBuffer.write('"api_endpoint_url": "$apiEndpoint", ');
    configValueBuffer.write('"environment": "$environment", ');
    configValueBuffer.write('"authority": "$authEndpoint", ');
    configValueBuffer.write('"auth_scopes": "$authScope", ');
    configValueBuffer.write('"application_client_id": "$clientId" ');
    configValueBuffer.write(fileEnd);
    return configValueBuffer.toString();
  }
}
