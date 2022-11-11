/// Device information for the client device that is using the application.
class Device {
  final String name;
  final String model;
  final String version;
  final String identifier;

  Device({
    required this.name,
    required this.version,
    required this.identifier,
    required this.model,
  });

  get isIPad => model.toLowerCase().contains("ipad");
  get isIPhone => model.toLowerCase().contains("iphone");
}
