class AppFormFieldValidator {
  AppFormFieldValidator._();

  static String? emailValidator(String? email) {
    if (email != null &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
            .hasMatch(email) &&
        !email.contains(' ')) {
      return null;
    }
    return 'Please enter a valid email';
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Please enter the password';
    } else if (password.length < 6) {
      return 'Password must have 6 or more characters';
    } else {
      return null;
    }
  }

  static String? changePasswordScreenValidations(String? password) {
    if (password == null || password.trim().isEmpty) {
      return password;
    } else if (password.length < 6) {
      return 'Password must have 6 or more characters';
    } else {
      return null;
    }
  }

  static String? emptyFieldValidator(String? value, String errorMessage) {
    if (value != null && value.trim().isNotEmpty) {
      return null;
    }
    return errorMessage;
  }
}
