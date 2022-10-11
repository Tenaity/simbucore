/*
  Platform Extensions
*/
import 'package:simbucore/integration_test/gherkin/builder/extended_world_builder.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:gherkin/gherkin.dart';

extension PlatformExtension on StepContext<ExtendedWorld> {
  /// Returns true if not the expected platform.
  /// Used to ignore feature test asserts for platform specific tests
  /// when run on the wrong device.
  /// This is a work around until the feature report can be 
  /// fixed so that it reports failing tests, or feature specific
  /// tests can be filtered out depending on the platform.
  /// 
  /// NB. Having this extension method makes it easily to identify and
  /// refactor when the way forward is found. 
  bool ignoreOtherPlatforms(UniversalPlatformType platformType) {
    if(platformType == UniversalPlatformType.Android){
      return !world.isAndroid;
    }
    if(platformType == UniversalPlatformType.IOS){
      return !world.isIos;
    }

    return false;
  }
}