import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/counter_observer.dart';
import 'package:studyapp5_riverpod_counter/app.dart';

void main() {
  runApp(ProviderScope(observers: [CounterLogger()], child: App()));
}
