// Message Bus Service contract 
class IMessageBusService{
  void fire(dynamic event) {}
  void setCounter(Map<String, int> eventCounter) {}
}