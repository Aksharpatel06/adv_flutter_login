import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

Column signupTextField(LoginController login) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: countinerColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          controller: login.txtUsername,
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
              hintText: 'Username',
              hintStyle: TextStyle(
                  color: primaryColor.withOpacity(0.3),)),
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
          controller: login.txtCreateEmail,
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
                  color: primaryColor.withOpacity(0.3),)),
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
          controller: login.txtCreatePwd,
          decoration: InputDecoration(
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
        height: 25,
      ),
      Container(
        decoration: BoxDecoration(
          color: countinerColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          controller: login.txtConfirmPwd,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor)),
              hintText: 'Confirm Password',
              hintStyle: TextStyle(
                color: primaryColor.withOpacity(0.3),
              )),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
