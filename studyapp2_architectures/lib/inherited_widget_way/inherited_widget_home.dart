import 'package:flutter/material.dart';

class InheritedWidgetHome extends StatefulWidget {
  const InheritedWidgetHome({ Key? key }) : super(key: key);

  @override
  _InheritedWidgetHomeState createState() => _InheritedWidgetHomeState();
}

class _InheritedWidgetHomeState extends State<InheritedWidgetHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Flutter with InheritedWidget'),
      ),
    );
  }
}