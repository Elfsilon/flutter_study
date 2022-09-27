class Counter {
  Counter(
    this.id,
    this.value,
  );

  final int id;
  final int value;

  factory Counter.fromJson(Map<String, dynamic> json) {
    final id = json["id"] as int?;
    if (id == null) throw Exception("passed object is not valid: 'id' is missing");

    final value = json["value"] as int?;
    if (value == null) throw Exception("passed object is not valid: 'value' is missing");

    return Counter(id, value);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
  };
}

extension MutableCounter on Counter {
  Counter increment() => Counter(id, value + 1);
  Counter decrement() => value > 0 ? Counter(id, value - 1) : Counter(id, value);
}