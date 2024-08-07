import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'componects/create_account_with_continue_login.dart';
import 'componects/login_title.dart';
import 'componects/signin_button.dart';
import 'componects/textfield_forgot.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
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
                  loginTitle(),
                  textFieldAndForgot(
                      loginController.txtEmail, loginController.txtPwd),
                  signInButton(loginController, loginController.txtEmail,
                      loginController.txtPwd),
                  createAccountWithLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
