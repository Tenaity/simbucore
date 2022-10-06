/*
  Platform Extensions
*/

import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:flutter_gherkin/flutter_gherkin.dart";
import "package:flutter_test/flutter_test.dart";

extension RiverpodProviderExtension
    on AppDriverAdapter<dynamic, dynamic, dynamic> {
  // Returns the Riverpod ref from the stateful app widget.
  WidgetRef providerRef<T>() {
    var st = nativeDriver.state;
    var dm = st(find.byType(T));
    var dmr = (dm as ConsumerState<ConsumerStatefulWidget>).ref;
    return dmr;
  }
}
