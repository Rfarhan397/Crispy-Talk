import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_back_button.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/model/res/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';


class EditProfile extends StatelessWidget {
   const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Color greyColor = const Color(0xffD9D9D9);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60.w,
              width: 100.w,
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SvgPicture.asset(
                    AppIcons.camera,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const AppTextWidget(
                    text: 'Change  Bg Photo',
                    fontWeight: FontWeight.w600,
                    color: Colors.black12,
                    fontSize: 22,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: greyColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppIcons.camera,
                      color: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const AppTextWidget(
                  text: 'Change Photo',
                  fontWeight: FontWeight.w600,
                  color: Colors.black12,
                  fontSize: 22,
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            buildUserInfo("Name:","Enter your name",5.w),
            buildUserInfo("Bio:","Edit your bio",11.w),
            SizedBox(
              height: 2.h,
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Align(
                  alignment: Alignment.centerLeft,
                   child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 3.w),
                     child: AppTextWidget(
                      text: 'Add Links:',
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      fontSize: 22,
                       textAlign: TextAlign.start,
                                     ),
                   ),

                 ),
                buildUserInfo("Instagram:","Add Link",3.w),
                buildUserInfo("Facebook:","Add Link",4.w),

              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding:  EdgeInsets.only(right: 7.w),
              child: AppButtonWidget(
                radius: 8,
                width: 25.w,
                height: 5.h,
                alignment: Alignment.centerRight,
                  onPressed: () {
                  Get.back();
                  },
                  text: 'Save'),
            )
          ],
        ),
      ),
    );
  }

  Padding buildUserInfo(name,hint,double width) {
    return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 AppTextWidget(
                  text: name,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18,
                                 ),
                SizedBox(width: width,),
                SizedBox(
                    height: 40,
                    width: 60.w,
                    child: AppTextField(radius: 8, hintText: hint)),
              ],
            ),
          );
  }
}
