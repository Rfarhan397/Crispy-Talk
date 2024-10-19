import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


const primaryColor = Color(0xFFFC9025);
const secondaryColor = Color(0xffFEE3C8);
const lightPurpleColor = Color(0xffB1AFE9);
const whiteColor = Color(0xFFFFFFFF);
const lightGrey = Color(0xFFE2E8F0);
const darkGrey = Color(0x89534F5D);
const lightBlue = Colors.lightBlue;
const Color customGrey = Color(0xFFE0E0E0);





////firebase///////

FirebaseFirestore fireStore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;






LinearGradient gradientColor = const LinearGradient(colors: [
  Color(0xffFF5000),
  Color(0xffFFCC38),
]);

RadialGradient lightModeGradient = const RadialGradient(colors: [
  Color(0x24ff5000),
  Color(0xF3BBB9D0),
]);

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'zzoe nubl luhf pnto';
  }

  // Regular expression for validating an email
  String pattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }

  return null;
}