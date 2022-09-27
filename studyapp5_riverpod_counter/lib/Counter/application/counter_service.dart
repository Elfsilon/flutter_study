import 'package:studyapp5_riverpod_counter/Counter/data/counter_repository.dart';
import 'package:studyapp5_riverpod_counter/Counter/domain/counter_model.dart';

class CounterService {
  CounterService({ required this.counterRepository });

  final CounterRepository counterRepository;
  
  Future<Counter> incrementCounter() async {
    final counter = await counterRepository.fetchCounter();
    final updated = counter.increment();
    await counterRepository.setCounter(updated);
    return updated;
  }

  Future<Counter> decrementCounter() async {
    final counter = await counterRepository.fetchCounter();
    final updated = counter.decrement();
    await counterRepository.setCounter(updated);
    return updated;
  }
}