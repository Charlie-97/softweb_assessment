mixin ControllerValidators {

  String? validateSupportController(String? value) {
    if (value!.trim().isEmpty) return 'message cannot be empty';

    return null;
  }

  // String? validateLoginPass(String? value) {
  //   if (value!.trim().isEmpty) return 'Password field cannot be empty';
  //
  //   return null;
  // }

  String? validatePass(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password field cannot be empty';
    }
    // Check minimum length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Check if it contains both letters and numbers
    bool hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));

    if (!hasLetter || !hasNumber) {
      return 'Password must contain both letters and numbers';
    }

    // Optional: Check for special characters
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasSpecialChar) {
      return 'Password must contain special characters';
    }

    return null; // Password is valid
  }

  String? validateField(String? value) {
    if (value!.trim().isEmpty) return 'field cannot be empty';

    return null;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password can not be empty';
    } else if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.?%&({)}[\/\]^;:",_\\-\\=+><|]).{8,}$')
        .hasMatch(value) ==
        false) {
      return 'The password entered is not valid';
    }

    return null;
  }


  String? emptyFieldValidator(String? value) {
    if (value!.isEmpty) {
      return 'Field can not be empty';
    }
    return null;
  }

  String? phoneNumValidator(String? value) {
    if (value!.isEmpty) {
      return 'Phone number cannot be empty';
    }

    // Regular expression to match a valid phone number pattern
    final RegExp phoneRegex = RegExp(r'^[0-9]{11}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number';
    }

    return null;
  }

  String? dateValidator(String? value) {
    if (value!.isEmpty) {
      return 'Date can not be empty';
    }
    return null;
  }

  String? bvnValidator(String? bvn) {
    if (bvn != null) {
      // Check if BVN is exactly 11 digits
      if (bvn.length != 11) {
        return 'BVN must be 11 digits long';
      }}
    return null;}

  String? emailValidator(String? email) {
    if (email != null) {
      if (isValidEmail(email)) {
      } else {
        return 'Email is incorrect';
      }
    } else {
      return 'Email can not be empty';
    }
    return null;
  }

  bool isValidEmail(String email) {
    // Regular expression for a simple email validation
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
      multiLine: false,
    );

    return emailRegExp.hasMatch(email);
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an address';
    }
    return null;
  }
  // String? validateConfirmPassword(String? value, String? password) {
  //   if (value!.trim().isEmpty) {
  //     return 'Password can not be empty';
  //   } else if (value != password) {
  //     return 'Password does not match';
  //   } else {
  //     return null;
  //   }
  // }

  String? validateAmount(String? value) {
    if (value!.trim().isEmpty) {
      return 'Amount can not be empty';
    } else if (double.parse(value.toString()) < 1.0) {
      return 'Input a valid Amount';
    }

    return null;
  }

  String? validateFullName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Fullname can not be empty';
    } else if (value.trim().length < 3) {
      return 'Fullname can not be less than 3 characters';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Name can not be empty';
    } else if (value.trim().length < 2) {
      return 'Name can not be less than 2 characters';
    }

    return null;
  }
  String? validateUsername(String? value) {
    if (value!.trim().isEmpty) {
      return 'Username can not be empty';
    } else if (value.trim().length < 2) {
      return 'Username can not be less than 2 characters';
    }

    return null;
  }

  String? validateSearchController (String? value){
    if (value!.trim().isEmpty) return 'please enter a valid username';

    return null;
  }

  String? validateOTP(String? value) {
    if (value!.trim().isEmpty) return 'OTP can not be empty';
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return "Email can not be empty";
    }  else if (value.trim().length < 2) {
      return 'Email can not be less than 2 characters';
    }
    return null;
  }

}