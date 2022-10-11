// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:universal_platform/universal_platform.dart';

extension WidgetListExtension on List<Widget>? {
  Widget toIndexedStack(int index) {
    if (this == null) {
      return Container();
    }

    if (this!.isEmpty) {
      return Container();
    }

    return IndexedStack(
      index: index,
      children: this ?? [],
    );
  }
}

extension WidgetExtension on Widget {
  pushRouteNavigation(BuildContext context, UniversalPlatformType platformType) {
    if (platformType == UniversalPlatformType.IOS) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => this),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => this),
    );
  }
}
