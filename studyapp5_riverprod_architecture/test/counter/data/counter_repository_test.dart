import 'package:flutter_test/flutter_test.dart';
import 'package:studyapp5_riverprod_architecture/counter/data/counter_repository.dart';
import 'package:studyapp5_riverprod_architecture/counter/domain/counter_model.dart';

void main() {
  test("fake repository test", () async {
    final counterRepository = CounterRepository();
    final counter = await counterRepository.fetch();
    expect(counter.id, Counter(0, 0).id);
    expect(counter.value, Counter(0, 0).value);
  });
}