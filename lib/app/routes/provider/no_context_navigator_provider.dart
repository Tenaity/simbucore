// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simbucore/app/routes/service/no_context_navigator.dart';

final noContextNavigatorProvider = Provider<NoContextNavigator>(
  (ref) => NoContextNavigator(),
);
