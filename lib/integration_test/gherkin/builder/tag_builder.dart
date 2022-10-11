import 'package:universal_platform/universal_platform.dart';

String get tagExpression {
  if (UniversalPlatform.isAndroid){
    return "not (@Ios or @IPad or @IPhone)";
  }

  if (UniversalPlatform.isIOS){
    return "not @Android";
  }

  return "";
}