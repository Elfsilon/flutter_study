import 'package:flutter/material.dart';

class UserState extends StatefulWidget {
  const UserState({
    super.key,
    required this.child,
  });
  
  final Widget child;

  static UserStateState of(BuildContext context, { bool build = true }) {
    final result = build 
      ? context.dependOnInheritedWidgetOfExactType<InheritedUserState>()
      : context.findAncestorWidgetOfExactType<InheritedUserState>();
    assert(result != null, "No UserState found in context");
    return result!.data;
  }

  @override
  UserStateState createState() => UserStateState();
}

class UserStateState extends State<UserState> {
  // 1. We need to add field here
  String name = "Jonh Snow";
  String weapon = "Sword";
  int kills = 0;

  void kill() {
    setState(() {
      kills++;
    });
  }  
  
  @override
  Widget build(BuildContext context) {
    return InheritedUserState(
      // 2. We need to duplicate code here
      name: name,
      weapon: weapon,
      kills: kills,
      data: this,
      child: widget.child, 
    );
  }
}

class InheritedUserState extends InheritedWidget {
  const InheritedUserState({
    super.key,
    // 3. We need to dublicate code here
    required this.name,
    required this.weapon,
    required this.kills,
    required this.data,
    required super.child,
  });

  // 4. And finally, duplicate here -> It's seems no good
  final String name;
  final String weapon;
  final int kills;
  final UserStateState data;

  @override
  bool updateShouldNotify(InheritedUserState oldWidget) => 
    // 5. Seriously, it's kind of joke, must update logic here -> see @notes.md
    kills != oldWidget.kills || name != oldWidget.name || weapon != oldWidget.weapon;
}