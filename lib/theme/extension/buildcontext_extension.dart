// Flutter imports:
import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  bool isCupertinoApp() {
    var cupertinoApp = findAncestorWidgetOfExactType<CupertinoApp>();
    return cupertinoApp != null;
  }
}
