import 'package:flutter/material.dart';

import '../../../utils/color.dart';



Column loginTitle(String title,String subTitle) {
  return Column(
    children: [
      const SizedBox(
        height: 30,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: title=='Create Account'?24:28,
          letterSpacing: 1,
          fontWeight: FontWeight.w900,
          color: secounderyColor,
        ),
      ),
       SizedBox(
        height: title=='Create Account'?10:25,
      ),
       Text(
        subTitle,
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize:title=='Create Account'?14:18,
          letterSpacing:title=='Create Account'?1: 1.5,
          wordSpacing: 1.2,
          fontWeight:title=='Create Account'?FontWeight.w500: FontWeight.w700,
          // color: secounderyColor,
        ),
      ),
       SizedBox(
        height:title=='Create Account'? 50:70,
      ),
    ],
  );
}