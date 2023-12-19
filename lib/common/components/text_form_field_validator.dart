class TextFormFieldValidator {
  static String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

 static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your password';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please confirm your password';
    }
    
    return null;
  }
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your username';
    }
    return null;
  }
}