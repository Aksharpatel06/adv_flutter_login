import 'dart:developer';

import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:adv_flutter_login/view/screen/home/home_screen.dart';
import 'package:adv_flutter_login/view/screen/sign%20in/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FirebaseSarvice {
  static FirebaseSarvice firebaseSarvice = FirebaseSarvice._();

  FirebaseSarvice._();

  LoginController loginController = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createEmailAndPassword(String? email, String? pwd) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email!, password: pwd!);
      Get.to(()=>const SignInScreen());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> compareEmailAndPwd(String? email, String? pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: pwd!);
      Get.to(()=>const HomeScreen());
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'user-not-found' || e.code=="invalid-email") {
        Fluttertoast.showToast(
              msg: "No User Found for that Email",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 16.0);
      } else if (e.code == 'wrong-password' || e.code=='invalid-credential') {
        Fluttertoast.showToast(
            msg: "Wrong Password Provided by User",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(e.code=='channel-error'){
        Fluttertoast.showToast(
            msg: "Enter the email and password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
