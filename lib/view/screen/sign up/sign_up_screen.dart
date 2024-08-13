import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../componects/create_account_with_continue_login.dart';
import '../componects/login_title.dart';
import 'componects/sign_up_button.dart';
import 'componects/text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img/Login Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  loginTitle('Create Account',
                      'Create an account so you can explore all the existing jobs'),
                  signupTextField(loginController),
                  signUpButton(loginController),
                  createAccountWithLogin(
                      'Already have an account', loginController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
