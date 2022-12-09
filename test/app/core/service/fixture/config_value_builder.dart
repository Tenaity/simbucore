class ConfigValueBuilder {
  static const fileStart = "{";
  static const fileEnd = "}";
  static const yourAzureADTenantID = "123abc45d-6e7f-8g9h-ij10-kl1mn23456o7";
  static const yourScopeID = "111aaa22b-3c4d-5e6f-ff78-gg9hh00000i1";
  static const apiEndpointUri = "https://simbudev";
  static const authEndpointUri = "https://login.microsoftonline.com/$yourAzureADTenantID/oauth2/v2.0/authorize";
  static const tokenEndpointUri = "https://login.microsoftonline.com/$yourAzureADTenantID/oauth2/v2.0/token";
  static const recipeManagementScope = "api://$yourScopeID/Recipe.Management";
  static const recipeAdminScope = "api://$yourScopeID/Recipe.Admin";


  final String apiEndpoint;
  final String environment;
  final String authScope;
  final String authEndpoint;
  final String tokenEndpoint;

  ConfigValueBuilder({
    this.apiEndpoint = apiEndpointUri,
    this.environment = "development", 
    this.authEndpoint = authEndpointUri,
    this.tokenEndpoint = tokenEndpointUri,
    this.authScope = "$recipeManagementScope;$recipeAdminScope"
  });

  String build() {
    var configValueBuffer = StringBuffer();
    configValueBuffer.write(fileStart);
    configValueBuffer.write('"api_endpoint_url": "$apiEndpoint", ');
    configValueBuffer.write('"environment": "$environment", ');
    configValueBuffer.write('"auth_endpoint": "$authEndpoint", ');
    configValueBuffer.write('"token_endpoint": "$tokenEndpoint", ');
    configValueBuffer.write('"auth_scopes": "$authScope" ');
    configValueBuffer.write(fileEnd);
    return configValueBuffer.toString();
  }
}
