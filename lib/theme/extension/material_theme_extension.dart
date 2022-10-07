// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:simbucore/theme/model/a_theme.dart';

extension MaterialThemeExtension on ATheme {
  ThemeData toMaterialThemeData() {
    var themeData = ThemeData(
      brightness: brightness,
      primaryColor: colorTheme.primaryColor,
      backgroundColor: colorTheme.primaryContrastingColor, //Color that contrasts with pimary
      //barBackgroundColor: colorTheme.barBackgroundColor,
      scaffoldBackgroundColor: colorTheme.scaffoldBackgroundColor,
    );
    return themeData;
  }
}
