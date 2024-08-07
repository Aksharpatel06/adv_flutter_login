import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

Column textFieldAndForgot(
    TextEditingController txtMail, TextEditingController txtPwd) {
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
              contentPadding: const EdgeInsets.all(18),
              fillColor: Colors.red,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor)),
              hintText: 'Email',
              hintStyle: TextStyle(color: primaryColor, fontSize: 20)),
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
          controller: txtPwd,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor)),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: primaryColor,
                fontSize: 20,
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
            fontSize: 18,
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
