// Message Bus Service contract 
import 'package:simbucore/app/routes/event/navigated.dart';

class IMessageBusService{
  void fire(dynamic event) {}
  void setCounter(Map<String, int> eventCounter) {}
  Navigated? lastNavigationEvent() => null;
}