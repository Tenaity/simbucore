import 'package:flutter/widgets.dart';

class ARoute{
  /// Route name e.g. Login
  final String name;
  /// Route title e.g. Login Screen
  final String title;
  /// Route path e.g. /login
  final String path;
  /// Widget to route to
  final Widget destination;

  /// An application route.
  ARoute(this.name, this.title, this.path, this.destination);
}