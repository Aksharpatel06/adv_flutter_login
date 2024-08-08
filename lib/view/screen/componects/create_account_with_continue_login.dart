import 'package:adv_flutter_login/view/helper/google_sign_in_sarvice.dart';
import 'package:adv_flutter_login/view/screen/sign%20in/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

Column createAccountWithLogin(String account) {
  return Column(
    children: [
      const SizedBox(
        height: 40,
      ),
      CupertinoButton(
        onPressed: () {
          if (account == 'Already have an account') {
            Get.to(() => const SignInScreen(),
                duration: const Duration(milliseconds: 500),
                transition: Transition.circularReveal);
          } else {
            Get.back();
          }
        },
        child: Text(
          account,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(
        height: 70,
      ),
      Text(
        'Or continue with',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
          color: secounderyColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () async {
              String status = await GoogleSignInSarvice.googleSignInSarvice.signInWithGoogle();
              Fluttertoast.showToast(msg: status);
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: countinerColor.withOpacity(0.5),
                image: const DecorationImage(
                  image: AssetImage('asset/img/google.png'),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: countinerColor.withOpacity(0.5),
              image: const DecorationImage(
                image: AssetImage('asset/img/facebook.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: countinerColor.withOpacity(0.5),
              image: const DecorationImage(
                image: AssetImage('asset/img/apple.png'),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
