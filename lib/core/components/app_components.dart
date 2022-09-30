import 'package:flutter/material.dart';

var formKeyForLogin = GlobalKey<FormState>();
var formKeyForSignUp = GlobalKey<FormState>();

TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();
TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();

String? validationForEmail(String value) {
  if (value.isEmpty) {
    return 'Email address must not be empty';
  } else if (value.contains('@')) {
  } else {
    return 'Invaild email address';
  }
  return null;
}

String? validationForNoEmpty(String value) {
  if (value.isEmpty) {
    return 'This field must not be empty';
  }
  return null;
}

String? validationForPassword(String value) {
  if (value.isEmpty) {
    return 'Password must not be empty';
  } else if (value.length <= 7) {
    return 'Password should be minimum 8 characters';
  }
  return null;
}

void loginValidatorActivation() {
  if (formKeyForLogin.currentState!.validate()) {}
}

void signUpValidatorActivation() {
  if (formKeyForSignUp.currentState!.validate()) {}
}
