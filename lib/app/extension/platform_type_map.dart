// Package imports:
import 'package:simbucore/app/model/platform_type.dart';
import 'package:universal_platform/universal_platform.dart';

extension PlatformTypeMap on UniversalPlatformType {
  PlatformType toDlPlatformType() {
    if (this == UniversalPlatformType.Android) {
      return PlatformType.android;
    }

    if (this == UniversalPlatformType.Fuchsia) {
      return PlatformType.fuchsia;
    }

    if (this == UniversalPlatformType.IOS) {
      return PlatformType.iOS;
    }

    if (this == UniversalPlatformType.Linux) {
      return PlatformType.linux;
    }

    if (this == UniversalPlatformType.MacOS) {
      return PlatformType.macOS;
    }
    
    if (this == UniversalPlatformType.Web) {
      return PlatformType.web;
    }

    return PlatformType.windows;
  }
}
