import 'dart:convert';

import 'package:studyapp5_riverpod_counter/Counter/data/counter_fake_api.dart';
import 'package:studyapp5_riverpod_counter/Counter/domain/counter_model.dart';

class CounterRepository {
  Future<Counter> fetchCounter() async {
    final res = await CounterFakeAPI.requestCurrentCounterState();
    final Map<String, dynamic> json = jsonDecode(res);
    return Counter.fromJson(json);
  }

  Future<void> setCounter(Counter counter) async {
    return await CounterFakeAPI.setCurrentCounterState(counter);
  }
}