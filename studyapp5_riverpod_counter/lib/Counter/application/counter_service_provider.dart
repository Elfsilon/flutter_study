import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studyapp5_riverpod_counter/Counter/application/counter_service.dart';
import 'package:studyapp5_riverpod_counter/Counter/data/counter_repository_provider.dart';

final counterServiceProvider = Provider<CounterService>((ref) {
  return CounterService(
    counterRepository: ref.watch(counterRepositoryProvider),
  );
});