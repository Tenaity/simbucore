// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:simbucore/theme/model/a_color_theme.dart';
import 'package:simbucore/theme/model/a_text_theme.dart';

// A single theme that is a set of colors and text preferences and other display settings like brightness
class ATheme {
  final ATextTheme? textTheme;
  final AColorTheme colorTheme;
  final Brightness brightness;

  ATheme({
    this.textTheme,
    required this.colorTheme,
    required this.brightness,
});
}
