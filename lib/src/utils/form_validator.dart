class FormValidator {
  static String? validateField(String? value, {String? field}) {
    if (value == null || value.isEmpty) {
      return "Please input ${field ?? "a value"}";
    }
  }
}
