import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/presentation/counter_controller_provider.dart';

class CounterView extends ConsumerWidget {
  const CounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterControllerProvider).asData;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
         state != null 
          ? Text('${state.value.value}', style: Theme.of(context).textTheme.headline4)
          : const CircularProgressIndicator(),
      ],
    );
  }
}