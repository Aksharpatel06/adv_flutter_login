import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

Column textFieldAndForgot(TextEditingController txtMail,
    TextEditingController txtPwd, LoginController login) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: countinerColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          controller: txtMail,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              fillColor: Colors.red,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor)),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: primaryColor.withOpacity(0.3),
              )),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      Container(
        decoration: BoxDecoration(
          color: countinerColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          obscureText: (!login.isPwdShow.value) ? true : false,
          obscuringCharacter: '*',
          controller: txtPwd,
          decoration: InputDecoration(
              suffixIcon: (!login.isPwdShow.value)
                  ? InkWell(
                      onTap: () {
                        login.pwdShowCharAndStar();
                      },
                      child: const Icon(Icons.remove_red_eye_sharp))
                  : InkWell(
                      onTap: () {
                        login.pwdShowCharAndStar();
                      },
                      child: const Icon(Icons.visibility_off)),
              contentPadding: const EdgeInsets.all(12),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor)),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: primaryColor.withOpacity(0.3),
              )),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot your password?',
          style: TextStyle(
            fontSize: 14,
            color: primaryColor,
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
