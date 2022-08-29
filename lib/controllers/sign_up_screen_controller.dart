import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

}