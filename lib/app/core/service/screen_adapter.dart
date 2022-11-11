/*
  Screen Adapter
 */

// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:simbucore/app/core/model/screen.dart';

class ScreenAdapter {
  // Use the current device info to
  Future<Screen> getScreen(BuildContext buildContext, bool isMobile) async {
    double ppi = (isMobile) ? 150 : 96;
    double width = MediaQuery.of(buildContext).size.width;
    double height = MediaQuery.of(buildContext).size.height;
    double diagonal = sqrt((width * width) + (height * height));
    return Screen(ppi: ppi, width: width, height: height, diagonal: diagonal);
  }
}
