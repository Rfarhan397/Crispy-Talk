import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constant.dart';
import '../../model/res/components/app_back_button.dart';
import '../../model/res/components/app_button_widget.dart';
import '../../model/res/constant/app_assets.dart';
import '../../model/res/routes/routes_name.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/app_text_field.dart';
import '../../provider/passwpordVisibility/passwordVisibilityProvider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<PasswordVisibilityProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                const AppTextWidget(
                  text: 'Sign Up',
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 3.h),
                AppTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  borderSides: false,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(AppAssets.person),
                  ),
                  // Add validation for name field
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.h),
                AppTextField(
                  controller: emailController,
                  hintText: 'Email',
                  borderSides: false,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(AppAssets.email),
                  ),
                  // Add validation for email field
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.h),
                AppTextField(
                  controller: passwordController,
                  obscureText: password.isObscure,
                  hintText: 'Password',
                  borderSides: false,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(AppAssets.password),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      password.toggleVisibility();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: password.isObscure
                          ? SvgPicture.asset(AppAssets.eye)
                          : SvgPicture.asset(AppAssets.eyeOff),
                    ),
                  ),
                  // Add validation for password field
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 3.h),
                AppTextField(
                  controller: cPassController,
                  obscureText: password.isObscure,
                  hintText: 'Confirm Password',
                  borderSides: false,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(AppAssets.password),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      password.toggleVisibility();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: password.isObscure
                          ? SvgPicture.asset(AppAssets.eye)
                          : SvgPicture.asset(AppAssets.eyeOff),
                    ),
                  ),
                  // Add validation for confirm password field
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),
                AppButtonWidget(
                  alignment: Alignment.center,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                  radius: 8,
                  width: 60.w,
                  fontWeight: FontWeight.w700,
                  text: 'Sign Up',
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWidget(
                      text: 'Already have an account?',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.loginScreen);
                      },
                      child: AppTextWidget(
                        text: ' Login',
                        color: primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void signUp() async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );

      // Save user data to Firestore
      await fireStore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'id' : timestampId,
        'userUid': FirebaseAuth.instance.currentUser!.uid,
        'createdAt': Timestamp.now(),
      });

      // Notify the user of successful sign-up
      Get.snackbar(backgroundColor: primaryColor,'Success', 'Sign Up Completed Successfully');

    } on FirebaseAuthException catch (e) {
      // Handle errors (e.g., email already in use, weak password)
      if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The email is already in use.');
      } else if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password is too weak.');
      }
    } catch (e) {
      // Handle general errors
      Get.snackbar('Error', 'An error occurred during sign up.');
    }
  }

}


