/*
  Application Theme provider
*/

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:simbucore/theme/extension/cupertino_theme_extension.dart';
import 'package:simbucore/theme/extension/material_theme_extension.dart';
import 'package:simbucore/theme/model/a_theme.dart';
import 'package:simbucore/theme/dark/dark_theme.dart';
import 'package:simbucore/theme/light/light_theme.dart';
import 'package:simbucore/theme/typo.dart';
import 'package:simbucore/theme/whitelabel/ee/ee_dark_theme.dart';
import 'package:simbucore/theme/whitelabel/ee/ee_light_theme.dart';

/*
  Whitelabel
*/
enum WhiteLabel {
  none,
  ee,
}

// Theme provider
class Themer with ChangeNotifier {
  late Brightness brightness = Brightness.light;
  late WhiteLabel whitelabel = WhiteLabel.none;

  late Typo _typo;
  late CupertinoThemeData _cupertinoTheme;
  late ThemeData _materialTheme;
  late ATheme _theme;

  Themer({Brightness? brightnessValue, WhiteLabel? whiteLabelValue}){
    if(brightnessValue != null){
      brightness = brightnessValue;
    }
    if(whiteLabelValue != null){
      whitelabel = whiteLabelValue;
    }
    _setTheme();
    _typo = Typo();
  }

  CupertinoThemeData get cupertinoThemeData {
    return _cupertinoTheme;
  }

  ThemeData get materialThemeData {
    return _materialTheme;
  }

  Color get panelBackgroundColor => _theme.colorTheme.panelBackgroundColor;
  Color get trafficLightRed => _theme.colorTheme.trafficLightRed;
  Color get trafficLightAmber => _theme.colorTheme.trafficLightAmber;
  Color get trafficLightGreen => _theme.colorTheme.trafficLightGreen;

  Typo get typo {
    return _typo;
  }

  void setBrightness(Brightness brightnessValue){
    brightness = brightnessValue;
    setThemeAndNotify();
  }

  void setWhitelabel(WhiteLabel whiteLabelValue){
    whitelabel = whiteLabelValue;
    setThemeAndNotify();
  }

  void setThemeAndNotify({Brightness? brightnessValue, WhiteLabel? whiteLabelValue}){
    if (brightnessValue != null) {
      brightness = brightnessValue;
    }
    if (whiteLabelValue != null) {
      whitelabel = whiteLabelValue;
    }
    _setTheme();
    notifyListeners();
  }

  void _setTheme(){
    var theme = whitelabel == WhiteLabel.ee && brightness == Brightness.dark
        ? eeDark
        : whitelabel == WhiteLabel.ee
            ? eeLight
            : brightness == Brightness.dark
                ? darkTheme
                : lightTheme;
    _theme = theme;            
    _cupertinoTheme = theme.toCupertinoThemeData();
    _materialTheme = theme.toMaterialThemeData();
  }
}
