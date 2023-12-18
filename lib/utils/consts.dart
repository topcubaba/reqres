import 'package:flutter/material.dart';

class AppColors {
  static const Color greyish = Color(0xFF393939);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFECE9E0);
  static const Color greenish = Color(0xFF184A40);
  static const Color orange = Color(0xFFFDAE37);
  static const Color lightOrange = Color(0xFFFAC762);
  static const Color error = Color(0xFFD32F2F);
  static const Color black = Color(0xFF000000);
}

class AppStrings {
  //General
  static const String appName = "reqres";
  static const String loginDesc = "Welcome! Please login to access";

  //Error Messages
  static const String loginError = "Login failed. Please check your credentials.";
  static const String missingCredential = "Please fill all required fields.";
  static const String error = "Error!";
  static const String invalidStatus = "Received invalid status code:";
  static const String connectionTimeout = "Connection timed out";
  static const String connectionFailed = "Connection failed due to internet connection";


  //Input Field Texts
  static const String email = "E-mail*";
  static const String emailHint = "Please enter your e-mail";
  static const String password = "Password*";
  static const String passwordHint = "Please enter your password";

  //Button Texts
  static const String login = "Login";

  //User Card Texts
  static const String firstName = "First Name: ";
  static const String lastName = "Last Name: ";
}