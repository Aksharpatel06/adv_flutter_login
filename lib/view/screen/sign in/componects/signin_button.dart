import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/color.dart';
import '../../../controller/login_controller.dart';



GestureDetector signInButton(LoginController loginController, TextEditingController txtMail, TextEditingController txtPwd) {
  return GestureDetector(
    onTap: () {
      loginController.validateInputs(txtMail, txtPwd);
      Fluttertoast.showToast(
          msg: (loginController.email.value.isNotEmpty ||
              loginController.pwd.value.isNotEmpty)
              ? loginController.email.value.isNotEmpty
              ? loginController.email.value
              : loginController.pwd.value
              : 'SuccessFully Login',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:
          (loginController.email.value.isNotEmpty ||
              loginController.pwd.value.isNotEmpty)
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
      child:  Text(
        'Sign in ',
        style: TextStyle(
            color: boxColor,
            fontSize: 23,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}