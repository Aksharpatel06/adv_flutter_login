import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignIn {
  static FacebookSignIn facebookSignIn = FacebookSignIn._();

  FacebookSignIn._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithFacebook() async {
    try{
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      await firebaseAuth.signInWithCredential(facebookAuthCredential);
      currentUser();
      return 'Suceess';
    }catch(e)
    {
      return 'failed';
    }

  }

  void emailLogout()
  {
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
