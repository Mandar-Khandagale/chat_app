import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

}