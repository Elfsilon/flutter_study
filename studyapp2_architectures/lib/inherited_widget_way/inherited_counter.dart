import 'package:flutter/material.dart';

class InheritedCounter extends InheritedWidget {
  const InheritedCounter({
    super.key,
    required super.child, 
  });

  static InheritedCounter? of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
    assert(result != null, "No InheritedCounter found in context");
    return result;
  }

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) => true;
}