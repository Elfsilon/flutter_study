import 'package:studyapp5_riverprod_architecture/counter/domain/counter_model.dart';

const fakeResponse = {
  "id": 0,
  "value": 0,
};

class CounterRepository {
  CounterRepository();
  
  Future<Counter> fetch() async {
    final res = await Future<Map<String, dynamic>>.delayed(const Duration(seconds: 3), () {
      return fakeResponse;
    });
    return Counter.fromJson(res);
  }
}