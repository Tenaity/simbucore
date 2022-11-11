// Package imports:
import 'package:universal_platform/universal_platform.dart';

class PlatformAdapter {
  UniversalPlatformType getPlatformType() {
    if (UniversalPlatform.isAndroid){
      return UniversalPlatformType.Android;
    }

    if (UniversalPlatform.isFuchsia){
      return UniversalPlatformType.Fuchsia;
    }

    if (UniversalPlatform.isIOS){
      return UniversalPlatformType.IOS;
    }

    if (UniversalPlatform.isLinux){
      return UniversalPlatformType.Linux;
    }

    if (UniversalPlatform.isMacOS){
      return UniversalPlatformType.MacOS;
    }
     
    if (UniversalPlatform.isWeb){
      return UniversalPlatformType.Web;
    }

    return UniversalPlatformType.Windows;
  }
}
