
import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/model/res/widgets/app_text_field.dart';
import 'package:crispytalk/provider/action/action_provider.dart';
import 'package:crispytalk/provider/passwpordVisibility/passwordVisibilityProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/res/components/app_back_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  text: 'Login',
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
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
                  // Add validation for email
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
                  // Add validation for password
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesName.forget);
                    },
                    child: AppTextWidget(
                      text: 'Forget Password?',
                      color: primaryColor,
                      fontSize: 12,
                      textDecoration: TextDecoration.underline,
                      underlinecolor: primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                AppButtonWidget(
                  alignment: Alignment.center,
                  onPressed: () {
                    // Validate the form before login
                    if (_formKey.currentState!.validate()) {
                      signIn();
                    }
                  },
                  radius: 8,
                  width: 60.w,
                  fontWeight: FontWeight.w700,
                  text: 'Log In',
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                    ),
                    const AppTextWidget(
                      text: 'Continue With',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Center(child: Image.asset(AppIcons.google)),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWidget(
                      text: 'New User?',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.signUp);
                      },
                      child: AppTextWidget(
                        text: ' Register Now',
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

  void signIn() async {
    try {
      ActionProvider.startLoading();
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.toNamed(RoutesName.mainScreen);

    } on FirebaseAuthException catch (e) {
      String errorMessage;
      ActionProvider.stopLoading();
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password provided.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is invalid.';
      } else if (e.code == 'user-disabled') {
        errorMessage = 'This user has been disabled.';
      } else if (e.code == 'too-many-requests') {
        errorMessage = 'Too many login attempts. Please try again later.';
      } else {
        errorMessage = 'Login failed. Please check your credentials.';
      }

      Get.snackbar(
        'Login Error',  // Title
        errorMessage,   // Message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    } catch (e) {
      ActionProvider.stopLoading();
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    }
  }

}
