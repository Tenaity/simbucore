// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:simbucore/app/core/model/device.dart';
import 'package:simbucore/app/core/service/device_adapter.dart';

final deviceProvider = FutureProvider<Device>((ref) async {
  return await DeviceAdapter().getDevice(); 
});
