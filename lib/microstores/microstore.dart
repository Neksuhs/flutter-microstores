typedef NotifyCallback = void Function();

class Microstore<T> {
  T defaultData;
  int index = 0;
  final List<NotifyCallback> _listeners = [];
  final List<T> _state = [];

  Microstore({required this.defaultData}) {
    _state.add(defaultData);
  }

  // history, returns a new list of all state written to the Microstore
  List<T> history() {
    return List.from(_state);
  }

  // listen, adds a callback to the listeners list
  void listen(NotifyCallback callback) {
    _listeners.add(callback);
  }

  // unListen removes a callback
  void unListen(NotifyCallback callback) {
    _listeners.remove(callback);
  }

  // read, reads the current state of the Microstore
  T read() {
    return _state[index];
  }

  // write, adds a new piece of state to the Microstore and runs an listeners
  void write(T value, bool run) {
    _state.add(value);
    index++;
    if (_listeners.isNotEmpty && run) {
      for (var i = 0; i < _listeners.length; i++) {
        _listeners[i]();
      }
    }
  }
}
