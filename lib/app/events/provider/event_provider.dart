// Package imports:
import 'package:event_bus/event_bus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:simbucore/app/events/service/event_store.dart';

final eventStoreProvider = Provider<EventStore>(
  (ref) => EventStore(EventBus()),
);