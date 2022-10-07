// Flutter imports:
import 'package:simbucore/theme/traffic_light_swatch.dart';
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:simbucore/theme/model/a_color_theme.dart';
import 'package:simbucore/theme/model/a_theme.dart';

AColorTheme lightColorTheme = AColorTheme(
  panelBackgroundColor: CupertinoColors.lightBackgroundGray,
  primaryColor: CupertinoColors.activeBlue,
  primaryContrastingColor: CupertinoColors.black,
  barBackgroundColor: const Color(0xFFEFEFF4),
  scaffoldBackgroundColor: CupertinoColors.systemBackground,
  trafficLightAmber: TrafficLightSwatch.amber,
  trafficLightGreen: TrafficLightSwatch.green,
  trafficLightRed: TrafficLightSwatch.red
);

ATheme lightTheme = ATheme(
  brightness: Brightness.light,
  colorTheme: lightColorTheme,
);

// CupertinoThemer cupertinoLight = const CupertinoThemer(
//   brightness: Brightness.light,
//   primaryColor: CupertinoColors.activeBlue,
//   primaryContrastingColor: CupertinoColors.black,
//   barBackgroundColor: Color(0xFFEFEFF4), //CupertinoColors.extraLightBackgroundGray, //Color(0xF0F9F9F9), //Nav & tab bar, light grey.
//   scaffoldBackgroundColor: CupertinoColors.systemBackground, //Main area
//   panelBackgroundColor: CupertinoColors.lightBackgroundGray
// );
