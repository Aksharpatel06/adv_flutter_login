import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:adv_flutter_login/view/helper/facebook_sign_in.dart';
import 'package:adv_flutter_login/view/helper/google_sign_in_sarvice.dart';
import 'package:adv_flutter_login/view/helper/user_sarvice.dart';
import 'package:adv_flutter_login/view/modal/details_modal.dart';
import 'package:adv_flutter_login/view/screen/home/home_screen.dart';
import 'package:adv_flutter_login/view/screen/sign%20up/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

Column createAccountWithLogin(String account, LoginController controller) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      CupertinoButton(
        onPressed: () {
          if (account == 'Already have an account') {
            Get.back();
          } else {
            Get.to(() => const SignUpScreen(),
                duration: const Duration(milliseconds: 500),
                transition: Transition.circularReveal);
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
        height: 30,
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
              String status = await GoogleSignInSarvice.googleSignInSarvice
                  .signInWithGoogle();
              Fluttertoast.showToast(msg: status);
              if (status == 'Suceess') {
                Get.to(const HomeScreen());
                controller.getUserDetails();
                User? user = GoogleSignInSarvice.googleSignInSarvice.currentUser();
                Map m1={
                  'name':user!.displayName,
                  'email':user.email,
                };

                DetailsModal details = DetailsModal(m1);
                UserSarvice.userSarvice.addUser(details);
              }
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
          CupertinoButton(
            onPressed: () async {
              String status = await FacebookSignIn.facebookSignIn
                  .signInWithFacebook();
              Fluttertoast.showToast(msg: status);
              if (status == 'Success') {
                Get.to(const HomeScreen());
                controller.getUserDetails();
                User? user = FacebookSignIn.facebookSignIn.currentUser();
                Map m1={
                  'name':user!.displayName,
                  'email':user.email,
                };

                DetailsModal details = DetailsModal(m1);
                UserSarvice.userSarvice.addUser(details);
              }
            },
            child: Container(
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
