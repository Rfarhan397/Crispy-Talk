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
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<PasswordVisibilityProvider>(context,listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: const AppBackButton()
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h,),
              const AppTextWidget(
                text: 'Sign Up',
                color: primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 3.h,),
               AppTextField(
                hintText: 'Full Name',
                borderSides: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(AppAssets.person,),
                ),
              ),
              SizedBox(height: 3.h,),
               AppTextField(
                hintText: 'Email',
                borderSides: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(AppAssets.email,),
                ),
              ),
              SizedBox(height: 3.h,),
               AppTextField(
                 obscureText: password.isObscure,
                hintText: 'Password',
                borderSides: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(AppAssets.password,),
                ),
                 suffixIcon:  GestureDetector(
                   onTap: () {
                     password.toggleVisibility();

                   },
                   child: Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: password.isObscure?
                     SvgPicture.asset(AppAssets.eye):
                     SvgPicture.asset(AppAssets.eyeOff),
                   ),
                 ),),

              SizedBox(height: 3.h,),
              AppTextField(
                obscureText: password.isObscure,
                hintText: 'Confirm Password',
                borderSides: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(AppAssets.password,),
                ),
                suffixIcon:  GestureDetector(
                  onTap: () {
                    password.toggleVisibility();

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: password.isObscure?
                    SvgPicture.asset(AppAssets.eye):
                    SvgPicture.asset(AppAssets.eyeOff),
                  ),
                ),),

              SizedBox(height: 5.h,),
              AppButtonWidget(
                  alignment: Alignment.center,
                  onPressed: () {},
                  radius: 8,
                  width: 60.w,
                  fontWeight: FontWeight.w700,
                  text: 'Sign Up'),
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(text: 'Already have an account?',fontSize: 16,fontWeight: FontWeight.w500,),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.loginScreen);
                      },
                      child: AppTextWidget(text: ' Login',color: primaryColor,fontSize: 16,)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
