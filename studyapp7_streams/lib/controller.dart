import 'dart:async';

class UserService {
  final StreamController<String> _controller;

  Stream<String> get stream => _controller.stream;

  UserService(): _controller = StreamController<String>();

  void addUser(String name) {
    _controller.add("added new user '$name'");
  }

  void removeUser(String name) {
    _controller.add("removed user '$name'");
  }

  Future<void> generateEvents() async {
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
    addUser("John Snow");
    await Future.delayed(duration);
    addUser("Snow John");
    await Future.delayed(duration);
    addUser("Snon Johw");
    await Future.delayed(duration);
    removeUser("Sno Joh");
    await Future.delayed(duration);
    addUser("Snoo doh");
    await Future.delayed(duration);
    removeUser("Snoop dog");
  }
}