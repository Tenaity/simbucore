// Flutter imports:
import 'package:simbucore/theme/traffic_light_swatch.dart';
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:simbucore/theme/model/a_color_theme.dart';
import 'package:simbucore/theme/model/a_theme.dart';

AColorTheme darkColorTheme = AColorTheme(
  panelBackgroundColor: CupertinoColors.black,
  primaryColor: CupertinoColors.activeGreen,
  primaryContrastingColor: CupertinoColors.white,
  barBackgroundColor: const Color(0xF01D1D1D),
  scaffoldBackgroundColor: CupertinoColors.black,
  trafficLightAmber: TrafficLightSwatch.lightAmber,
  trafficLightGreen: TrafficLightSwatch.lightGreen,
  trafficLightRed: TrafficLightSwatch.red
);

ATheme darkTheme = ATheme(
  brightness: Brightness.dark,
  colorTheme: darkColorTheme,
);
