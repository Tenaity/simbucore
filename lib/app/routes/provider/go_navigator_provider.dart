// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/event_store/provider/event_provider.dart';
import 'package:simbucore/app/routes/service/go_navigator.dart';

final goNavigatorProvider = Provider<GoNavigator>(
  (ref) => GoNavigator(ref.read(eventStoreProvider)),
);
