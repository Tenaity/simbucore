import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Uses the root WidgetRef to resolve providers without a Riverpod WidgetRef.
class ProviderResolver{
  static late WidgetRef _ref;
  static bool _hasWidgetRef = false;

  static WidgetRef get ref {
    assert(!_hasWidgetRef, "RiverpodResolver: WidgetRef not available to resolve providers, the root widget must build before we can use this service.");
    return _ref;
  }

  static set widgetRef(WidgetRef widgetRef) => {_ref = widgetRef, _hasWidgetRef = true};
}