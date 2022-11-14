// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/event_action/service/action_registrar.dart';

final actionRegistrarProvider = Provider<ActionRegistrar>(
  (ref) => ActionRegistrar(),
);
