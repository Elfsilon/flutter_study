class Counter {
  Counter(
    this.id,
    this.value,
  );

  final int id;
  final int value;

  factory Counter.fromJson(Map<String, dynamic> data) {
    final id = data["id"] as int?;
    if (id == null) {
      throw UnsupportedError("Invalid data: $data -> \"id\" is missing");
    }

    final value = data["value"] as int?;
    if (value == null) {
      throw UnsupportedError("Invalid data: $data -> \"value\" is missing");
    }

    return Counter(id, value);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "value": value,
    };
  }
}

extension MutableCounter on Counter {
  Counter increment() => Counter(id, value + 1);
  Counter decrement() => value > 0 ? Counter(id, value - 1) : Counter(id, value);
}