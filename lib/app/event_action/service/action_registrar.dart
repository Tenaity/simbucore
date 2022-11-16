class ActionRegistrar{
  final Map<String,Function> actions = {};

  void register(String eventType, Function() action) {
    actions[eventType] = action;
  }

  Function? findByEventType(String eventType) {
    var action = actions[eventType];
    return action;
  }
}