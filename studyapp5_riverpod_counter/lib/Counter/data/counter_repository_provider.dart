import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/data/counter_repository.dart';

final counterRepositoryProvider = Provider<CounterRepository>((ref) {
  return CounterRepository();
});