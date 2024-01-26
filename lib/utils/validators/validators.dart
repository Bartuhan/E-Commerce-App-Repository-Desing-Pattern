class TValidatorHelper {
  // Email validator

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address.';
    }
    return null;
  }

  // Password validator

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for Long
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for UpperCase
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contains at least one uppercase letter.';
    }

    // Check for Number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contains at least one number.';
    }

    // Check for Special Character
    if (!value.contains(RegExp(r'[@.#$!%*?&^,":{}|<>]'))) {
      return 'Password must contains at least one special characters.';
    }

    return null;
  }

  // Validate Phone Number

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (1- digits required).';
    }
    return null;
  }
}
