import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controllers/sign_in_screen_controller.dart';
import 'package:flutter_chat_app/screens/sign_up_screen.dart';
import 'package:flutter_chat_app/screens/widgets/common_textform_field.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:flutter_chat_app/utils/validators.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final controller = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat App",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,  vertical: 50.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CommonTextFormField(
                controller: controller.emailController,
                labelText: "Email",
                hintText: "Your email address",
                validation: (value) => Validators.validateEmail(value, context),
              ),
              CommonTextFormField(
                controller: controller.passwordController,
                labelText: "Password",
                hintText: "Enter your password",
                validation: (String? value) => Validators.validateEmptyField(value, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(controller.formKey.currentState!.validate()){
                    }
                  },
                  child: const Text(
                    "Sign-in",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have an Account?",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: const Text(
                      "Sign-up",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}
