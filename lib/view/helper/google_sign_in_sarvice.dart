
import 'dart:developer';

import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInSarvice {
  static GoogleSignInSarvice googleSignInSarvice = GoogleSignInSarvice._();
  GoogleSignInSarvice._();

  LoginController loginController= Get.find();

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      firebaseAuth.signInWithCredential(authCredential);
      currentUser();


      return "Suceess";
    } catch (e) {
      log(e.toString());
      return "Failed";
    }
  }

  void emailLogout()
  {
    googleSignIn.signOut();
    firebaseAuth.signOut();
  }

  User? currentUser()
  {
    User? user = firebaseAuth.currentUser;
    if(user!=null)
      {
        print(user.email);
        print(user.displayName);
        print(user.phoneNumber);
        print(user.photoURL);
      }
    return user;
  }
}
