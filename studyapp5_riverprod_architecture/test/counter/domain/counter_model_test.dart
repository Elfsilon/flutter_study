import 'package:flutter_test/flutter_test.dart';
import 'package:studyapp5_riverprod_architecture/counter/domain/counter_model.dart';

void main() {
  test("increment counter test", () {
    final counter = Counter(0, 0).increment();
    expect(counter.value, 1);
  });
  group("decrement counter tests", () {
    test("if counter > 0", () {
      final counter = Counter(0, 1).decrement();
      expect(counter.value, 0);
    });
    test("if counter == 0", () {
      final counter = Counter(0, 0).decrement();
      expect(counter.value, 0);
    });
    test("if counter < 0", () {
      final counter = Counter(0, -1).decrement();
      expect(counter.value, -1);
    });
  });
}