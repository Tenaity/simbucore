class ConfigValueBuilder {
  static const fileStart = "{";
  static const fileEnd = "}";

  final String apiEndpoint;
  final String environment;

  ConfigValueBuilder({
    this.apiEndpoint = "https://simbudev",
    this.environment = "development",
  });

  String build() {
    var configValueBuffer = StringBuffer();
    configValueBuffer.write(fileStart);
    configValueBuffer.write('"api_endpoint_url": "$apiEndpoint", ');
    configValueBuffer.write('"environment": "$environment" ');
    configValueBuffer.write(fileEnd);
    return configValueBuffer.toString();
  }
}
