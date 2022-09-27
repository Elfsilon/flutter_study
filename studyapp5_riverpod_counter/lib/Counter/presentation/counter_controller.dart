import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/application/counter_service.dart';
import 'package:studyapp5_riverpod_counter/Counter/domain/counter_model.dart';

class CounterController extends StateNotifier<AsyncValue<Counter>> {
  CounterController({ required this.counterService }) : super(AsyncValue.data(Counter(0, 0)));

  final CounterService counterService;

  Future<void> increment() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return counterService.incrementCounter();
    });
  }

  Future<void> decrement() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return counterService.decrementCounter();
    });
  }
}