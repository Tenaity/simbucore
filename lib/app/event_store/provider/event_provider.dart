// Package imports:
import 'package:event_bus/event_bus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/event_store/service/event_bus_service.dart';

// Project imports:
import 'package:simbucore/app/event_store/service/event_store.dart';

final eventStoreProvider = Provider<EventStore>(
  (ref) => EventStore(EventBusService(EventBus())),
);
