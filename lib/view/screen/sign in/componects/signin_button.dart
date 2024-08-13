import 'package:adv_flutter_login/view/helper/firebase_sarvice.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../controller/login_controller.dart';



GestureDetector signInButton(LoginController loginController, TextEditingController txtMail, TextEditingController txtPwd) {
  return GestureDetector(
    onTap: () {
      FirebaseSarvice.firebaseSarvice.compareEmailAndPwd(loginController.txtEmail.text, loginController.txtPwd.text);
    },
    child: Container(
      height: 55,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: secounderyColor,
          borderRadius: BorderRadius.circular(10)),
      child:  Text(
        'Sign in ',
        style: TextStyle(
            color: boxColor,
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}