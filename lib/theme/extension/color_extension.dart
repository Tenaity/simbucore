/*
    Color extensions

    Credits:
    Lighten/Darken a color from: https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart
      usage:
        final lightRed = lighten(Colors.red);
        final darkBlue = darken(Colors.blue, .3);
 */

// Flutter imports:
import 'package:flutter/painting.dart';

extension ColorExtension on Color {
  Color darken({double amount = .1}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness / (1 + amount)).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten({double amount = .1}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness * (1 + amount)).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
