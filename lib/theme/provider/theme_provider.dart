// Dart imports:
import 'dart:ui';

// Package imports:
import 'package:simbucore/theme/themer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeNotifier extends StateNotifier<Themer> {
  ThemeNotifier(super.state);

  // Change the theme's brightness mode
  void changeBrightnessMode(Brightness brightness) {
    state = Themer(brightnessValue: brightness, whiteLabelValue: state.whitelabel);
  }

  // Change the theme's whitelabel
  void changeWhitelabel(WhiteLabel whiteLabel) {
    state = Themer(brightnessValue: state.brightness, whiteLabelValue: whiteLabel);
  }
}

final defaultTheme = Themer(
  brightnessValue: Brightness.light,
  whiteLabelValue: WhiteLabel.none,
);

final themeProvider = StateNotifierProvider<ThemeNotifier, Themer>((ref) => ThemeNotifier(defaultTheme));