// Package imports:
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Notifications from the OS about state changes to the application.
class LifecycleStateNotifier
    extends StateNotifier<AppLifecycleState?> {
  LifecycleStateNotifier(super.state);

  setLifecycleState(AppLifecycleState appLifecycleState){
    state = appLifecycleState;
  }
}

final appLifecycleStateProvider = StateNotifierProvider<
    LifecycleStateNotifier, AppLifecycleState?>(
  (ref) => LifecycleStateNotifier(null),
);