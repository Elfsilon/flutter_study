import 'package:studyapp5_riverpod_counter/Counter/domain/counter_model.dart';

class CounterFakeAPI {
  static int _id = 0;
  static int _value = 0;

  static Future<String> requestCurrentCounterState() async {
    return Future.delayed(const Duration(milliseconds: 200), () {
      return '{ "id": $_id, "value": $_value }';
    });
  }

  static Future<void> setCurrentCounterState(Counter counter) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _id = counter.id;
    _value = counter.value;
  }
}