import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyapp5_riverprod_architecture/counter/data/counter_repository.dart';

class App extends MaterialApp {
  App({super.key}) : super(
    title: "Counter with reverprod architecture",
    home: RepositoryProvider(
      create: (_) => CounterRepository(),
      child: const CounterView(),
    ), 
  );
}

class CounterView extends StatelessWidget {
  const CounterView({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with reverprod architecture"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "0",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}