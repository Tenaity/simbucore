// Flutter imports:
import 'package:simbucore/theme/traffic_light_swatch.dart';
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:simbucore/theme/model/a_color_theme.dart';
import 'package:simbucore/theme/model/a_theme.dart';
import 'package:simbucore/theme/whitelabel/ee/ee_swatch.dart';
import 'ee_text.dart';

AColorTheme eeDarkColorTheme = AColorTheme(
  panelBackgroundColor: eeSwatch.onlineAqua,
  primaryColor: eeSwatch.yellow,
  primaryContrastingColor: eeSwatch.darkGrey,
  barBackgroundColor: eeSwatch.onlineAqua,
  scaffoldBackgroundColor: CupertinoColors.black,
  trafficLightAmber: TrafficLightSwatch.lightAmber,
  trafficLightGreen: TrafficLightSwatch.lightGreen,
  trafficLightRed: TrafficLightSwatch.red
);

ATheme eeDark = ATheme(
  brightness: Brightness.light,
  colorTheme: eeDarkColorTheme,
  textTheme: eeTextTheme,
);

// const CupertinoThemer eeDarkCupertino = CupertinoThemer(
//   brightness: Brightness.light,
//   primaryColor: eeSwatch.yellow,
//   primaryContrastingColor: eeSwatch.darkGrey,
//   barBackgroundColor: eeSwatch.onlineAqua, //Nav & tab bar.
//   textTheme: CupertinoTextThemeData(
//     navTitleTextStyle: TextStyle(fontFamily: "NobbleeLight", fontSize: 22,),
//     navActionTextStyle: TextStyle(color: eeSwatch.yellow),
//     textStyle: TextStyle(fontFamily: "Rubrik", fontSize: 14, color: eeSwatch.grey)
//   ),
//   scaffoldBackgroundColor: CupertinoColors.black,
//   panelBackgroundColor: eeSwatch.onlineAqua,
// );
