import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_back_button.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../model/res/widgets/customDialog.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: const AppBackButton(),
        title: const AppTextWidget(text: 'Account',color: primaryColor,fontWeight: FontWeight.w700,fontSize: 18,),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 3.h,),
          AppButtonWidget(
              fontWeight: FontWeight.w600,
              alignment: Alignment.center,
              width: 80.w,
              radius: 8,
              onPressed: () {
                CustomDialog.show(
                  title: "Log out?",
                  content: "Are you sure you want to logout?",
                  cancel: "Cancel",
                  yes: "Sure",
                  showTextField: false,
                  showTitle: true,
                );


                // showDialog(
                //     context: context,
                //     builder: (BuildContext context){
                //       return const CustomDialog(
                //         showTextField: false,
                //         title: 'Log Out?',
                //         content:  'Are you sure you want to Log Out?',
                //         cancel: "Cancel",
                //         yes: "Sure",
                //       );
                //     });
              },
              text: "Log Out"),
          SizedBox(height: 4.h,),
          AppButtonWidget(
              fontWeight: FontWeight.w600,
              alignment: Alignment.center,
              width: 80.w,
              radius: 8,
              onPressed: () {
                CustomDialog.show(
                    title: "Delete Account?",
                    content: "Are you sure you want to Delete your Account",
                    cancel: "Cancel",
                    yes: "Sure",
                    showTextField: true,
                    showTitle: true,
                  hintText: 'Write your reason here...'
                );
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context){
                //       return const CustomDialog(
                //         showTextField: false,
                //         title: 'Delete?',
                //         content:  'Are you sure you want to Delete this Account?',
                //         cancel: "Cancel",
                //         yes: "Sure",
                //       );
                //     });
              },
              text: "Delete my Account"),
        ],
      )
    );
  }
}
