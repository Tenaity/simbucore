// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:simbucore/theme/model/a_theme.dart';

extension CupertinoThemeExtension on ATheme {
  CupertinoThemeData toCupertinoThemeData() {
    CupertinoThemeData themeData;

    if (textTheme == null) {
      themeData = CupertinoThemeData(
        brightness: brightness,
        primaryColor: colorTheme.primaryColor,
        primaryContrastingColor: colorTheme.primaryContrastingColor,
        barBackgroundColor: colorTheme.barBackgroundColor,
        scaffoldBackgroundColor: colorTheme.scaffoldBackgroundColor,
      );
    } else {
      themeData = CupertinoThemeData(
          brightness: brightness,
          primaryColor: colorTheme.primaryColor,
          primaryContrastingColor: colorTheme.primaryContrastingColor,
          barBackgroundColor: colorTheme.barBackgroundColor,
          scaffoldBackgroundColor: colorTheme.scaffoldBackgroundColor,
          textTheme: CupertinoTextThemeData(
              navTitleTextStyle: textTheme!.navTitleTextStyle,
              navActionTextStyle: textTheme!.navActionTextStyle,
              textStyle: textTheme!.textStyle));
    }

    return themeData;
  }
}
