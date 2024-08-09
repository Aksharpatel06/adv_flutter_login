import 'package:adv_flutter_login/view/controller/login_controller.dart';
import 'package:adv_flutter_login/view/screen/sign%20in/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    controller.getUserDetails();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Obx(
                () => CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(controller.url.value),
                ),
              ),
            ),
            Obx(() => Text(controller.email.value)),
            Obx(() => Text(controller.name.value)),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.emailLayout();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ));
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome! You are logged in."),
      ),
    );
  }
}
