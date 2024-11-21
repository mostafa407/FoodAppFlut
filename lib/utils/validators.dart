class Validators{
  static String? validEmail(String? value){
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);

    if (value == null || value.isEmpty) {
      return 'Please enter a valid email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;  // Valid email
  }
static String? validPassword(String? value){
  String passwordPattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  RegExp regExp = RegExp(passwordPattern);

  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  } else if (!regExp.hasMatch(value)) {
    return 'Password must be at least 8 characters, '
        'include an uppercase letter, number, and special character';
  }
  return null;  // Valid password
}
}


