// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/routes/service/go_navigator.dart';

final goNavigatorProvider = Provider<GoNavigator>(
  (ref) => GoNavigator(),
);
