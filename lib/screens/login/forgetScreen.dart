import 'package:crispytalk/model/res/routes/routes.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../constant.dart';
import '../../model/res/components/app_back_button.dart';
import '../../model/res/components/app_button_widget.dart';
import '../../model/res/constant/app_assets.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/app_text_field.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            const AppTextWidget(
              text: 'Forgot Password',
              color: primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

            SizedBox(height: 5.h,),
            RichText(
              text: const TextSpan(
                text: 'Please write your ',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Email',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ' to receive the confirmation code to set a ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                  TextSpan(
                    text: 'new password',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h,),
            AppTextField(
              hintText: 'Email',
              borderSides: false,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(AppAssets.email,),
              ),
            ),
            SizedBox(height: 5.h,),
            AppButtonWidget(
                alignment: Alignment.center,
                onPressed: () {
                  _sendPasswordResetEmail();
                  Get.toNamed(RoutesName.code);
                },
                radius: 8,
                height: 5.h,
                width: 60.w,
                fontWeight: FontWeight.w700,
                text: 'Confirm Email'),
          ],
        ),
      ),
    );
  }

  void _sendPasswordResetEmail() {}
}
