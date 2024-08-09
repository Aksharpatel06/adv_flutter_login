import 'package:adv_flutter_login/firebase_options.dart';
import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:adv_flutter_login/view/helper/google_sign_in_sarvice.dart';
import 'package:adv_flutter_login/view/screen/home/home_screen.dart';
import 'package:adv_flutter_login/view/screen/sign%20in/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleSignInSarvice.googleSignInSarvice.currentUser()==null?const SignInScreen():const HomeScreen(),
    );
  }
}


