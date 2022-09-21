import 'package:email_validator/email_validator.dart';

class Validator {
  static String? email(String? value) {    
      if (value == null || value.isEmpty) return "Required field";
      if (!EmailValidator.validate(value)) return "Invalid email format";
  }

  static String? password(String? value) {
    RegExp reg = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^\w\s]).{8,}");
    if (value == null || value.isEmpty) return "Required field";
    if (!reg.hasMatch(value)) {
      return "Password must contains at least:\n- 1 uppecrase character\n- 1 lowercase character\n- 1 special character (@!.*...)\n- 1 digit\n- 8 characters long";
    } 
  }
}