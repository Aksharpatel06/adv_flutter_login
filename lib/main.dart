import 'package:adv_flutter_login/firebase_options.dart';
import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:adv_flutter_login/view/helper/google_sign_in_sarvice.dart';
import 'package:adv_flutter_login/view/helper/user_sarvice.dart';
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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     Get.put(LoginController());
//     return  GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: GoogleSignInSarvice.googleSignInSarvice.currentUser()==null?const SignInScreen():const HomeScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: UserSarvice.userSarvice.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List userList = snapshot.data!.docs
              .map(
                (e) => e.data() as Map<String, dynamic>,
              )
              .toList();
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userList[index]['name']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await UserSarvice.userSarvice.addUser();
        },
      ),
    );
  }
}
