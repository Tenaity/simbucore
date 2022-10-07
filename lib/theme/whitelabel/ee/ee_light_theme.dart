// Flutter imports:
import 'package:simbucore/theme/traffic_light_swatch.dart';
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:simbucore/theme/model/a_color_theme.dart';
import 'package:simbucore/theme/model/a_theme.dart';
import 'package:simbucore/theme/whitelabel/ee/ee_swatch.dart';
import 'ee_text.dart';

AColorTheme eeLightColorTheme = AColorTheme(
  panelBackgroundColor: eeSwatch.onlineAqua,
  primaryColor: eeSwatch.yellow,
  primaryContrastingColor: eeSwatch.darkGrey,
  barBackgroundColor: eeSwatch.aqua,
  scaffoldBackgroundColor: CupertinoColors.black,
  trafficLightAmber: TrafficLightSwatch.amber,
  trafficLightGreen: TrafficLightSwatch.green,
  trafficLightRed: TrafficLightSwatch.red
);


ATheme eeLight = ATheme(
  brightness: Brightness.light,
  colorTheme: eeLightColorTheme,
  textTheme: eeTextTheme,
);

// const CupertinoThemer eeLightCupertino = CupertinoThemer(
//   brightness: Brightness.light,
//   primaryColor: eeSwatch.yellow,
//   primaryContrastingColor: eeSwatch.darkGrey,
//   barBackgroundColor: eeSwatch.aqua, //Nav & tab bar.
//   textTheme: CupertinoTextThemeData(
//     navTitleTextStyle: TextStyle(fontFamily: "NobbleeLight", fontSize: 22),
//     navActionTextStyle: TextStyle(color: eeSwatch.yellow),
//     textStyle: TextStyle(fontFamily: "Rubrik", fontSize: 14, color: eeSwatch.darkGrey)
//   ),
//   panelBackgroundColor: eeSwatch.onlineAqua
// );
