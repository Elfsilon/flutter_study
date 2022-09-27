import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/application/counter_service_provider.dart';
import 'package:studyapp5_riverpod_counter/Counter/presentation/counter_controller_provider.dart';
import 'package:studyapp5_riverpod_counter/Counter/presentation/counter_view.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Riverpod Counter"),
      ),
      body: const Center(
        child: CounterView(),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterControllerProvider.notifier).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => ref.read(counterControllerProvider.notifier).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), 
    );
  }
}