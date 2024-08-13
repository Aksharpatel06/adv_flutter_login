import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/color.dart';
import '../../../controller/login_controller.dart';

GestureDetector signUpButton(LoginController loginController) {
  return GestureDetector(
    onTap: () {
      loginController.validateInputs(loginController.txtCreateEmail,
          loginController.txtCreatePwd, loginController.txtConfirmPwd);
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
          backgroundColor: (loginController.error.value.isNotEmpty ||
                  loginController.pwd.value.isNotEmpty ||
                  loginController.txtConfirmPwd.text.isEmpty)
              ? Colors.redAccent
              : Colors.green.withOpacity(0.7),
          textColor: Colors.white,
          fontSize: 16.0);
    },
    child: Container(
      height: 55,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: secounderyColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Sign up',
        style: TextStyle(
            color: boxColor, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
