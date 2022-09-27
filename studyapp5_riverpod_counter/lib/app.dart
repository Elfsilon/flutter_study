import 'package:flutter/material.dart';
import 'package:studyapp5_riverpod_counter/Counter/presentation/counter_page.dart';

class App extends MaterialApp {
  App({super.key}) : super(
    title: "Flutter Riverpod Counter",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: const CounterPage(),
  );
}