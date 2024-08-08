import 'package:adv_flutter_login/view/helper/firebase_sarvice.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseSarvice.firebaseSarvice.emailLogout();
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
