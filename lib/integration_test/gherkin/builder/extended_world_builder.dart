import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:universal_platform/universal_platform.dart';

Future<World> createExtendedWorld(TestConfiguration config) async {
  return ExtendedWorld(config);
}

class ExtendedWorld extends FlutterWorld {
  late bool isAndroid = UniversalPlatform.isAndroid;
  late bool isIos = UniversalPlatform.isIOS;
  late TestConfiguration testConfiguration;
  ExtendedWorld(TestConfiguration config) {
    testConfiguration = config;
    isAndroid = UniversalPlatform.isAndroid;
    isIos = UniversalPlatform.isIOS;
  }
}