class Validator {
  static String? email(String? value) {
      RegExp reg = RegExp(r"\w+@\w+\.\w+");
      if (value != null && value.isNotEmpty && reg.hasMatch(value)) return value;
      return "Invalid email format";
  }

  static String? password(String? value) {
    RegExp reg = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^\w\s]).{8,}");
    if (value != null && value.isNotEmpty && reg.hasMatch(value)) return value;
    return "Invalid password format";
  }
}