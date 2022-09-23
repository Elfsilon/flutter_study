import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("How does StreamBuilder work"),
          centerTitle: true,
        ),
        body: const Center(child: StreamBuilderWidget()),
      ),
    );
  }
}

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({super.key});

  Stream<int> generateInts() async* {
    // Some connection to API simulation
    await Future.delayed(const Duration(seconds: 5));

    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (i == 4) throw Exception("Some error");
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: generateInts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Text("Snapshot is null [ConnectionState == none]");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              Text("Loading..."),
            ],
          );
        } else if (
          snapshot.connectionState == ConnectionState.active || 
          snapshot.connectionState == ConnectionState.done
        ) {
          if (snapshot.hasError) {
            return Text("Connected but snapshot has an error: ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            return Text("Connected. Current stream data is ${snapshot.data}");
          } else {
            return const Text("Connected but current snapshot hasn't data");
          }
        } else {
          return Text("Connection state == [${snapshot.connectionState}]");
        }
      },
    );
  }
}