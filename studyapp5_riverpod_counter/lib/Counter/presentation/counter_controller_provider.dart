import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/application/counter_service_provider.dart';
import 'package:studyapp5_riverpod_counter/Counter/domain/counter_model.dart';
import 'package:studyapp5_riverpod_counter/Counter/presentation/counter_controller.dart';

final counterControllerProvider =
  StateNotifierProvider.autoDispose<CounterController, AsyncValue<Counter>>(
    (ref) {
      return CounterController(
        counterService: ref.watch(counterServiceProvider)
      );
    }
  );