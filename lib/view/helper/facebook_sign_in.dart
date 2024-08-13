import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignIn {
  static FacebookSignIn facebookSignIn = FacebookSignIn._();

  FacebookSignIn._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FacebookAuth facebookAuth = FacebookAuth.instance;

  Future<String> signInWithFacebook() async {
    try {
      log('Starting Facebook sign-in');
      final LoginResult loginResult = await facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        log('Facebook login successful');
        log('Access Token: ${loginResult.accessToken!.tokenString}');

        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        // Sign in to Firebase with the Facebook credential
        await firebaseAuth.signInWithCredential(facebookAuthCredential);
        log('Firebase sign-in successful');
        currentUser();

        return 'Success';
      } else if (loginResult.status == LoginStatus.cancelled) {
        log('Facebook login canceled by the user.');
        return 'Login canceled by the user.';
      } else {
        log('Facebook login failed: ${loginResult.status}');
        return 'Failed';
      }
    } catch (e) {
      log('Error during Facebook sign-in: $e');
      return 'Failed';
    }
  }

  // Future<String> signInWithFacebook() async {
  //   try {
  //     log('Starting Facebook sign-in');
  //     final LoginResult loginResult = await facebookAuth.login();
  //
  //     if (loginResult.status == LoginStatus.success) {
  //       log('Facebook login successful');
  //       log('Access Token: ${loginResult.accessToken!.tokenString}');
  //
  //       // Create a credential from the access token
  //       final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
  //
  //       // Sign in to Firebase with the Facebook credential
  //       await firebaseAuth.signInWithCredential(facebookAuthCredential);
  //       log('Firebase sign-in successful');
  //       currentUser();
  //
  //       return 'Success';
  //     } else {
  //       log('Facebook login failed: ${loginResult.status}');
  //       return 'Failed';
  //     }
  //   } catch (e) {
  //     log('Error during Facebook sign-in: $e');
  //     return 'Failed';
  //   }
  // }

  void emailLogout() {
    facebookAuth.logOut();
    firebaseAuth.signOut();
  }

  User? currentUser() {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      log('User Email: ${user.email}');
      log('User Name: ${user.displayName}');
      log('User Phone: ${user.phoneNumber}');
      log('User Photo: ${user.photoURL}');
    }
    return user;
  }
}
