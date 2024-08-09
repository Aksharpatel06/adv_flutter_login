import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../componects/create_account_with_continue_login.dart';
import '../componects/login_title.dart';
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
                  GestureDetector(
                    onTap: () {
                      loginController.validateInputs(
                          loginController.txtCreateEmail,
                          loginController.txtCreatePwd,
                          loginController.txtConfirmPwd);
                      Fluttertoast.showToast(
                          msg: (loginController.error.value.isNotEmpty ||
                                  loginController.pwd.value.isNotEmpty)
                              ? loginController.error.value.isNotEmpty
                                  ? loginController.error.value
                                  : loginController.pwd.value
                              : 'SuccessFully Login',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor:
                              (loginController.error.value.isNotEmpty ||
                                      loginController.pwd.value.isNotEmpty||loginController.txtConfirmPwd.text.isEmpty )
                                  ? Colors.redAccent
                                  : Colors.green.withOpacity(0.7),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: secounderyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: boxColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  createAccountWithLogin('Already have an account',loginController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
