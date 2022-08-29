import 'package:flutter/material.dart';

class Validators {

   static String? validateEmptyField(String? number, BuildContext context) {
    if (number != null && number.isNotEmpty) {
      return null;
    }else {
      return "Field cannot be empty";
    }
  }

   static String? validateEmail(String value, BuildContext context) {
     var regExp = RegExp(
         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+");
     if (value.isEmpty) {
       return "Enter a Valid Email";
     } else if (!regExp.hasMatch(value)) {
       return "Enter a Valid Email";
     }else {
       return null;
     }
   }


}