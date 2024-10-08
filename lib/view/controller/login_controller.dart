import 'dart:developer';

import 'package:adv_flutter_login/view/helper/facebook_sign_in.dart';
import 'package:adv_flutter_login/view/helper/firebase_sarvice.dart';
import 'package:adv_flutter_login/view/helper/google_sign_in_sarvice.dart';
import 'package:adv_flutter_login/view/screen/home/home_screen.dart';
import 'package:adv_flutter_login/view/screen/sign%20in/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/user_sarvice.dart';
import '../modal/details_modal.dart';

class LoginController extends GetxController {
  RxBool isPwdShow = false.obs;

  void pwdShowCharAndStar() {
    isPwdShow.value = !isPwdShow.value;
  }

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtCreateEmail = TextEditingController();
  TextEditingController txtCreatePwd = TextEditingController();
  TextEditingController txtConfirmPwd = TextEditingController();
  TextEditingController txtPwd = TextEditingController();

  RxString error = ''.obs;
  RxString pwd = ''.obs;

  RxString email = ''.obs;
  RxString name = ''.obs;
  RxString url = ''.obs;

  Future<void> getUserDetails() async {
    User? user = GoogleSignInSarvice.googleSignInSarvice.currentUser();
    User? userFacebook = FacebookSignIn.facebookSignIn.currentUser();

    if (user != null) {
      email.value = user.email!;
      url.value = user.photoURL!;
      name.value = user.displayName!;
    }
    if (userFacebook != null) {
      email.value = userFacebook.email!;
      url.value = userFacebook.photoURL!;
      name.value = userFacebook.displayName!;
    }
  }

  void emailLayout() {
    FirebaseSarvice.firebaseSarvice.emailLogout();
    GoogleSignInSarvice.googleSignInSarvice.emailLogout();
    FacebookSignIn.facebookSignIn.emailLogout();
  }

  Future<void> validateInputs(TextEditingController txtEmail,
      TextEditingController txtPwd, TextEditingController txtConfirmPwd) async {
    error.value = validateEmail(txtEmail.text) ?? '';
    pwd.value = validatePassword(txtPwd.text, txtConfirmPwd.text) ?? '';
    log('${error.isEmpty && pwd.isEmpty}');
    if (error.isEmpty && pwd.isEmpty) {
      await FirebaseSarvice.firebaseSarvice
          .createEmailAndPassword(txtEmail.text, txtConfirmPwd.text);
      Map m1={
        'name':txtUsername.text,
        'email':txtCreateEmail.text,
      };

      DetailsModal details = DetailsModal(m1);
      UserSarvice.userSarvice.addUser(details);
      Get.to(const SignInScreen());
    }
    update();
  }

  validateEmail(String? value) {
    if (value!.isEmpty || value == '') {
      return 'Please enter email!';
    } else {
      var g = '';
      var gmail = 'moc.liamg@';
      var gmai = 0;
      var sepcialChecking = 0;

      g = value;
      var len = g.length;
      var k = 0;
      if (len >= 11) {
        for (var j = len - 1; j > len - 11; j--) {
          if (g[j] != gmail[k]) {
            gmai = 1;
          }
          k++;
        }
        if (gmai == 0) {
          for (var j = 0; j < len - 11; j++) {
            if ((g.codeUnitAt(j) >= 33 && g.codeUnitAt(j) <= 47) ||
                (g.codeUnitAt(j) >= 58 && g.codeUnitAt(j) <= 64)) {
              sepcialChecking = 1;
            }
          }
          if (sepcialChecking == 0) {
          } else {
            return 'Invalid email format';
          }
        } else {
          return 'Invalid domain name!';
        }
      } else {
        return 'Please enter email!';
      }
    }
    return null;
  }

  validatePassword(String? value, String? pwd) {
    if (value!.isEmpty || value == '') {
      return 'Enter strong password!';
    } else {
      var upparcaseChecking = 0;
      var lowercaseChecking = 0;
      var numberChecking = 0;
      var sepcialCharcterChecking = 0;
      var len = value.length;
      if (len >= 8 && len <= 32) {
        for (var i = 0; i < len; i++) {
          if (value.codeUnitAt(i) >= 65 && value.codeUnitAt(i) <= 90) {
            upparcaseChecking = 1;
          }
        }
        if (upparcaseChecking == 1) {
          for (var i = 0; i < len; i++) {
            if (value.codeUnitAt(i) >= 97 && value.codeUnitAt(i) <= 122) {
              lowercaseChecking = 1;
            }
          }
          if (lowercaseChecking == 1) {
            for (var i = 0; i < len; i++) {
              if (value.codeUnitAt(i) >= 48 && value.codeUnitAt(i) <= 57) {
                numberChecking = 1;
              }
            }
            if (numberChecking == 1) {
              for (var i = 0; i < len; i++) {
                if ((value.codeUnitAt(i) >= 33 && value.codeUnitAt(i) <= 47) ||
                    (value.codeUnitAt(i) >= 58 && value.codeUnitAt(i) <= 64)) {
                  sepcialCharcterChecking = 1;
                }
              }
              if (sepcialCharcterChecking == 1) {
              } else {
                return 'Enter sepcial charcter password!';
              }
            } else {
              return 'Enter number password!';
            }
          } else {
            return 'Enter lower case password!';
          }
        } else {
          return 'Enter upper case password!';
        }
      } else {
        return 'Enter strong password!';
      }
    }
    if (value != pwd) {
      return 'Enter correct password!';
    }
    return null;
  }
}
