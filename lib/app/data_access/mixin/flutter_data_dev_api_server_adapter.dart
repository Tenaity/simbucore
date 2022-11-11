import 'package:flutter_data/flutter_data.dart';
import 'package:simbucore/app/core/service/global_environment_values.dart';

mixin FlutterDataApiServerAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  String get baseUrl =>  GlobalEnvironmentValues.instance.apiEndpoint;
}