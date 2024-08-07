import 'package:flutter/material.dart';

import '../../../../utils/color.dart';



Column loginTitle() {
  return Column(
    children: [
      const SizedBox(
        height: 30,
      ),
      Text(
        'Login here',
        style: TextStyle(
          fontSize: 32,
          letterSpacing: 1,
          fontWeight: FontWeight.w900,
          color: secounderyColor,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      const Text(
        'Welcome back you’ve \nbeen missed!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 1.5,
          wordSpacing: 1.2,
          fontWeight: FontWeight.w700,
          // color: secounderyColor,
        ),
      ),
      const SizedBox(
        height: 70,
      ),
    ],
  );
}