import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controllers/sign_up_screen_controller.dart';
import 'package:flutter_chat_app/pages/widget/icon_button.dart';
import 'package:flutter_chat_app/screens/widgets/common_textform_field.dart';
import 'package:flutter_chat_app/utils/validators.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

   final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: CustomIconButton(
            icon: CupertinoIcons.back,
            onTap: () {
              Get.back();
            },
          ),
        ),
        title: const Text(
          "Sign-up",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,  vertical: 20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CommonTextFormField(
                controller: controller.nameController,
                labelText: "Name",
                hintText: "Enter your name",
                validation: (String? value) => Validators.validateEmptyField(value, context),
              ),
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
                    "Register",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
