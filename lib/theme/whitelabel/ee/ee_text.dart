// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:simbucore/theme/model/a_text_theme.dart';
import 'package:simbucore/theme/whitelabel/ee/ee_swatch.dart';

ATextTheme eeTextTheme = ATextTheme(
  navTitleTextStyle: const TextStyle(
    fontFamily: "NobbleeLight",
    fontSize: 22,
  ),
  navActionTextStyle: const TextStyle(
    color: eeSwatch.yellow,
  ),
  textStyle: const TextStyle(
    fontFamily: "Rubrik",
    fontSize: 14,
    color: eeSwatch.grey,
  ),
);
